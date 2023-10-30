# frozen_string_literal: true

class RemoteFeed
  attr_reader :feed

  delegate :title, :url, :entries, to: :feed

  def self.from_link(feed_link)
    response = Faraday.new { |f| f.response :follow_redirects }.get(feed_link)
    feed = Feedjira.parse(response.body)
    new(feed)
  end

  def initialize(feed)
    @feed = feed
  end

  def link = url

  def items = entries.map { |i| Item.new(i) }

  def description = feed.try(:description)

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
