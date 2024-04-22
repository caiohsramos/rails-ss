# frozen_string_literal: true

class Feed < ApplicationRecord
  include Refreshable
  include Enrichable

  belongs_to :folder, optional: true
  has_many :items, dependent: :destroy

  validates :title, presence: true
  validates :feed_link, presence: true
end
