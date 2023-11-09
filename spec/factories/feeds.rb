# frozen_string_literal: true

FactoryBot.define do
  factory :feed do
    title { Faker::Lorem.name }
    description { Faker::Lorem.paragraph(sentence_count: 3) }
    link { Faker::Internet.url }
    feed_link { Faker::Internet.url }
    refresh_state { association :refresh_state, feed: instance }
  end
end
