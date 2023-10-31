# frozen_string_literal: true

class SettingsController < ApplicationController
  def update
    @settings.update(settings_params)

    redirect_back_or_to root_path
  end

  private

  def settings_params
    params.require(:settings).permit(:filter)
  end
end
