# frozen_string_literal: true

class CreateRefreshStates < ActiveRecord::Migration[7.1]
  def change
    create_table :refresh_states do |t|
      t.references :feed, null: false, foreign_key: true
      t.datetime :refreshed_at
      t.string :state, null: false
      t.text :error

      t.timestamps
    end
  end
end
