# frozen_string_literal: true

class CreateFeed
  include Interactor
  delegate :feed_link, :folder_id, to: :context

  def call
    context.feed = Feed.new({ feed_link:, folder_id:, **rss_data })
    if context.feed.save
      RefreshFeedJob.perform_now(context.feed.id)
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
