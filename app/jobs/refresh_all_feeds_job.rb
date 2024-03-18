# frozen_string_literal: true

class RefreshAllFeedsJob < ApplicationJob
  queue_as :default

  def perform
    Feed.find_each(&:refresh_feed)
  end
end
