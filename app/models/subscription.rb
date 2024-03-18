# frozen_string_literal: true

class Subscription
  Result = Data.define(:success?)

  def import(file)
    opml = OPML.parse file.read
    outline = opml['outline']
    outline.each do |o|
      create_feed(o)
    end
    Result.new(success?: true)
  rescue StandardError
    Result.new(success?: false)
  end

  private

  def create_feed(outline, folder_id = nil)
    if outline['outline'].present?
      folder = Folder.create!(title: outline['text'])
      return outline['outline'].each { |o| create_feed(o, folder.id) }
    end

    feed = Feed.build_with_remote_data(feed_link: outline['xmlUrl'], folder_id:)
    feed.save!
  end
end
