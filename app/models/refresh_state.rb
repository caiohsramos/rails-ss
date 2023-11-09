# frozen_string_literal: true

class RefreshState < ApplicationRecord
  include AASM

  belongs_to :feed

  aasm column: :state do
    state :success, initial: true
    state :error, :refreshing

    event :start, success: -> { update(error: nil) } do
      transitions from: %i[error success], to: :refreshing
    end

    event :finish do
      transitions from: :refreshing, to: :error, if: -> { error.present? }
      transitions from: :refreshing, to: :success
    end
  end
end
