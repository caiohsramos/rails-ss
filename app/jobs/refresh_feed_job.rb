# frozen_string_literal: true

class RefreshFeedJob < ApplicationJob
  queue_as :default

  def perform(feed_id)
    @feed = Feed.find(feed_id)
    rss.items.map do |item|
      next if feed.items.exists?(guid: item.guid)

      create_item(feed, item)
    rescue ActiveRecord::RecordInvalid
      next
    end
  end

  private

  attr_reader :feed

  def rss
    @rss ||= RemoteFeed.from_link(feed.feed_link)
  end

  def create_item(feed, item)
    feed.items.create!(guid: item.guid,
                       title: item.title,
                       link: item.link,
                       description: item.description,
                       content: item.content,
                       author: item.author,
                       date: item.date,
                       image: item.image,
                       podcast_url: item.podcast_url,
                       status: :unread)
  end
end
