# frozen_string_literal: true

class SessionsController < ApplicationController
  before_action :check_authorized, only: %i[new]

  def new; end

  def create
    if Authorization.instance.valid?(params[:username], params[:password])
      session[:authorized] = true
      redirect_to root_url, notice: 'Logged in!'
    else
      flash.now.alert = 'Username or password is invalid'
      render :new, status: :unprocessable_entity
    end
  end

  private

  def check_authorized
    redirect_to root_url, notice: 'Already logged in!' if session[:authorized]
  end
end
