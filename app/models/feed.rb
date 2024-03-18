# frozen_string_literal: true

class Feed < ApplicationRecord
  include Refreshable

  belongs_to :folder, optional: true
  has_many :items, dependent: :destroy

  validates :title, presence: true
  validates :feed_link, presence: true

  def self.build_with_remote_data(...)
    feed = new(...)
    remote_feed = RemoteFeed.from_link(feed.feed_link)
    feed.title = remote_feed.title
    feed.description = remote_feed.description
    feed.link = remote_feed.link
    feed.icon = remote_feed.icon

    feed
  end
end
