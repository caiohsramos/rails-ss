# frozen_string_literal: true

class SettingsController < ApplicationController
  skip_before_action :set_current_filter, only: [:update]

  def update
    session[:current_filter] = settings_params[:current_filter] if settings_params[:current_filter].present?
    set_current_filter

    redirect_back_or_to root_path
  end

  private

  def settings_params
    params.require(:settings).permit(:current_filter)
  end
end
