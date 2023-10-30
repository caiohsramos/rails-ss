# frozen_string_literal: true

class ChangeFeedFieldsToNotNull < ActiveRecord::Migration[7.1]
  def change
    change_column_null :feeds, :title, false
    change_column_null :feeds, :feed_link, false
  end
end
