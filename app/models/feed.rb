# frozen_string_literal: true

class Feed < ApplicationRecord
  belongs_to :folder, optional: true
  has_many :items, dependent: :destroy
  has_one :refresh_state, dependent: :destroy

  validates :title, presence: true
  validates :feed_link, presence: true
end
