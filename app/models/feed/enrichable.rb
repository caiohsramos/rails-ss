# frozen_string_literal: true

class Feed
  module Enrichable
    extend ActiveSupport::Concern
    class_methods do
      def build_with_remote_data(...)
        feed = new(...)
        remote_feed = RemoteFeed.from_link(feed.feed_link)
        feed.title = remote_feed.title
        feed.description = remote_feed.description
        feed.link = remote_feed.link
        feed.icon = remote_feed.icon

        feed
      end
    end
  end
end
