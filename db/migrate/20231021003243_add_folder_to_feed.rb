# frozen_string_literal: true

class AddFolderToFeed < ActiveRecord::Migration[7.1]
  def change
    add_reference(:feeds, :folder, null: true, foreign_key: true)
  end
end
