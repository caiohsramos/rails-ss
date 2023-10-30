# frozen_string_literal: true

class CreateFolders < ActiveRecord::Migration[7.1]
  def change
    create_table :folders do |t|
      t.string :title, null: false

      t.timestamps
    end
  end
end
