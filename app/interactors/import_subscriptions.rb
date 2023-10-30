# frozen_string_literal: true

class ImportSubscriptions
  include Interactor
  delegate :import_file, to: :context

  def call
    opml = OPML.parse import_file.read
    outline = opml['outline']
    outline.each do |o|
      create_feed(o)
    end
  end

  private

  def create_feed(outline, folder_id = nil)
    if outline['outline'].present?
      folder = Folder.create!(title: outline['text'])
      return outline['outline'].each { |o| create_feed(o, folder.id) }
    end

    CreateFeed.call(feed_link: outline['xmlUrl'], folder_id:)
  end
end
