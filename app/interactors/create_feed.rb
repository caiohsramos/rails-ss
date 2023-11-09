# frozen_string_literal: true

class CreateFeed
  include Interactor
  delegate :feed_link, :folder_id, to: :context

  def call
    feed = Feed.new({ feed_link:, folder_id:, **rss_data })
    feed.build_refresh_state
    if feed.save
      RefreshFeedJob.perform_now(feed.id)
      context.feed = feed
    else
      context.fail!
    end
  end

  private

  def rss_data
    feed = RemoteFeed.from_link(feed_link)
    {
      title: feed.title,
      description: feed.description,
      link: feed.link,
      icon: feed.icon
    }
  end
end
