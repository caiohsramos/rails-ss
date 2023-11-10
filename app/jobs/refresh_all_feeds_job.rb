# frozen_string_literal: true

class RefreshAllFeedsJob < ApplicationJob
  queue_as :default

  def perform
    Feed.find_in_batches do |group|
      Parallel.each(group, in_threads: 4) do |feed|
        RefreshFeedJob.perform_now(feed.id)
      end
    end
  end
end
