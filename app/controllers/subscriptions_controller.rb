# frozen_string_literal: true

class SubscriptionsController < ApplicationController
  def import
    result = Subscription.new.import(params[:import_file])

    if result.success?
      redirect_back_or_to root_path, notice: 'Import complete.'
    else
      redirect_to root_path, alert: 'Failed to import subscriptions.'
    end
  end

  # def export; end
end
