# frozen_string_literal: true

class RefreshFeedJob < ApplicationJob
  queue_as :default

  def perform(feed_id)
    @feed = Feed.find(feed_id)
    @feed.refresh_state.start!
    create_items
  ensure
    @feed.refresh_state.finish!
    Turbo::StreamsChannel.broadcast_refresh_to :refresh_states
  end

  private

  attr_reader :feed

  def create_items
    rss.items.map do |item|
      next if feed.items.exists?(guid: item.guid)

      create_item(feed, item)
    rescue ActiveRecord::RecordInvalid => e
      add_error(e)
      next
    end
  end

  def rss
    RemoteFeed.from_link(feed.feed_link)
  rescue StandardError => e
    add_error(e)
    RemoteFeed.empty
  end

  def add_error(error)
    feed.refresh_state.update(error: error.message)
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
