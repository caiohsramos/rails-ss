# frozen_string_literal: true

FactoryBot.define do
  factory :folder do
    title { Faker::ProgrammingLanguage.name }
  end
end
