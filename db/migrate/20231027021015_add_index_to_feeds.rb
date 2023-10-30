# frozen_string_literal: true

class AddIndexToFeeds < ActiveRecord::Migration[7.1]
  def change
    add_index :items, %i[guid feed_id], unique: true
  end
end
