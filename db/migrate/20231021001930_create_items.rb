# frozen_string_literal: true

class CreateItems < ActiveRecord::Migration[7.1]
  def change
    create_table :items do |t|
      t.text :guid, null: false
      t.text :title
      t.text :link
      t.text :description
      t.text :content
      t.text :author
      t.datetime :date
      t.string :status
      t.text :image
      t.text :podcast_url
      t.references :feed, null: false, foreign_key: true

      t.timestamps
    end
  end
end
