# frozen_string_literal: true

class Item < ApplicationRecord
  belongs_to :feed

  include Litesearch::Model

  validates :guid, presence: true, uniqueness: { scope: :feed_id }
  enum :status, { unread: 'unread', read: 'read', starred: 'starred' }

  scope :with_filter, ->(filter) { filter.in?(statuses.keys) ? where(status: filter) : all }

  litesearch do |schema|
    schema.fields %i[title description content author]
    schema.field :feed, target: 'feeds.title'
  end
end
