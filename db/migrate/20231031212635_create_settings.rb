# frozen_string_literal: true

class CreateSettings < ActiveRecord::Migration[7.1]
  def change
    create_table :settings do |t|
      t.string :filter, null: false, default: 'all'
      t.references :selection, polymorphic: true

      t.timestamps
    end
  end
end
