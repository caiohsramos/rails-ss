# frozen_string_literal: true

class Item < ApplicationRecord
  belongs_to :feed

  validates :guid, presence: true, uniqueness: { scope: :feed_id }
  enum :status, { unread: 'unread', read: 'read', starred: 'starred' }
end
