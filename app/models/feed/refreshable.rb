# frozen_string_literal: true

class Feed
  module Refreshable
    extend ActiveSupport::Concern

    included do
      has_one :refresh_state, dependent: :destroy
      after_create_commit :refresh_feed
      after_create :create_refresh_state
    end

    def refresh_feed
      RefreshFeedJob.perform_later(id)
    end
  end
end
