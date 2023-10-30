# frozen_string_literal: true

class Folder < ApplicationRecord
  has_many :feeds, dependent: :nullify
  has_many :items, through: :feeds

  validates :title, presence: true
end
