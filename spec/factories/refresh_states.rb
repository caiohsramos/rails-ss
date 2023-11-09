# frozen_string_literal: true

FactoryBot.define do
  factory :refresh_state do
    feed
    refreshed_at { '2023-11-09 13:20:35' }
    state { 'success' }
    error { nil }
  end
end
