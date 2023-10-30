# frozen_string_literal: true

class PagesController < ApplicationController
  skip_before_action :set_current_selection, only: [:home]

  def home
    session[:current_selection_id] = nil
    session[:current_selection_type] = nil
  end
end
