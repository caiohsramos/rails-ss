# frozen_string_literal: true

FactoryBot.define do
  factory :item do
    guid { SecureRandom.uuid }
    title { Faker::Lorem.name }
    link { Faker::Internet.url }
    description { Faker::Lorem.paragraph(sentence_count: 3) }
    content { Faker::Lorem.paragraph(sentence_count: 3) }
    author { Faker::Lorem.name }
    date { Faker::Time.between(from: DateTime.now - 1, to: DateTime.now) }
    status { 'unread' }
    image { nil }
    podcast_url { nil }
    feed
  end
end
