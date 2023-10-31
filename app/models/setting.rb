# frozen_string_literal: true

class Setting < ApplicationRecord
  belongs_to :selection, polymorphic: true, optional: true
  validates :filter, inclusion: { in: %w[all unread starred] }
end
