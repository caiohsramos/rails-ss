# frozen_string_literal: true

class SettingsController < AuthorizedController
  def update
    @settings.update(settings_params)

    redirect_to(@settings.selection || root_path)
  end

  private

  def settings_params
    params.require(:settings).permit(:filter)
  end
end
