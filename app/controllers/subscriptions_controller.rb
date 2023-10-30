# frozen_string_literal: true

class SubscriptionsController < ApplicationController
  def import
    result = ImportSubscriptions.call(import_file: params[:import_file])
    if result.success?
      redirect_back_or_to root_path, notice: 'Import complete.'
    else
      # ???
    end
  end

  # def export; end
end
