# frozen_string_literal: true

class Item
  module Searchable
    extend ActiveSupport::Concern

    included do
      include Litesearch::Model
      litesearch do |schema|
        schema.fields %i[title description content author]
        schema.field :feed, target: 'feeds.title'
      end
    end
  end
end
