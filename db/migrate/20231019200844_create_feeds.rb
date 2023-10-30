# frozen_string_literal: true

class CreateFeeds < ActiveRecord::Migration[7.1]
  def change
    create_table :feeds do |t|
      t.string :title
      t.text :description
      t.text :link
      t.text :feed_link

      t.timestamps
    end
  end
end
