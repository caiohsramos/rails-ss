# frozen_string_literal: true

class AddIconToFeeds < ActiveRecord::Migration[7.1]
  def change
    add_column :feeds, :icon, :blob
  end
end
