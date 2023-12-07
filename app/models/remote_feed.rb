# frozen_string_literal: true

class RemoteFeed
  attr_reader :feed, :feed_link

  delegate :title, :url, :entries, to: :feed

  def self.from_link(feed_link)
    response = Faraday.new do |f|
      f.response :raise_error
      f.response :follow_redirects
    end.get(feed_link)
    feed = Feedjira.parse(response.body)
    new(feed, feed_link)
  end

  def self.empty
    empty_feed = Data.define(:entries)[[]]
    new(empty_feed, nil)
  end

  def initialize(feed, feed_link)
    @feed = feed
    @feed_link = feed_link
  end

  def link = url

  def items = entries.map { |i| Item.new(i) }

  def description = feed.try(:description)

  def icon
    return if feed_link.blank?

    host = URI.parse(feed_link).host
    response = Faraday.new { |f| f.response :follow_redirects }.get("https://icons.duckduckgo.com/ip3/#{host}.ico")
    return if response.status == 404

    response.body
  end

  class Item
    attr_reader :entry

    delegate :title, :url, :entry_id, :published, to: :entry

    def initialize(entry)
      @entry = entry
    end

    def guid = entry_id

    def link = url

    def description = entry.try(:summary)

    def content = entry.try(:content) || entry.try(:summary)

    def date = published

    def author = entry.try(:author)

    def image = entry.try(:media_thumbnail_url) || entry.try(:itunes_image)

    def podcast_url; end
  end
end
