# frozen_string_literal: true

class Item < ApplicationRecord
  include Searchable

  belongs_to :feed
  validates :guid, presence: true, uniqueness: { scope: :feed_id }
  enum :status, { unread: 'unread', read: 'read', starred: 'starred' }
  scope :with_filter, ->(filter) { filter.in?(statuses.keys) ? where(status: filter) : all }
end
