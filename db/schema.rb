# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2023_10_31_221151) do
  create_table "feeds", force: :cascade do |t|
    t.string "title", null: false
    t.text "description"
    t.text "link"
    t.text "feed_link", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "folder_id"
    t.binary "icon"
    t.index ["folder_id"], name: "index_feeds_on_folder_id"
  end

  create_table "folders", force: :cascade do |t|
    t.string "title", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "items", force: :cascade do |t|
    t.text "guid", null: false
    t.text "title"
    t.text "link"
    t.text "description"
    t.text "content"
    t.text "author"
    t.datetime "date"
    t.string "status"
    t.text "image"
    t.text "podcast_url"
    t.integer "feed_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["feed_id"], name: "index_items_on_feed_id"
    t.index ["guid", "feed_id"], name: "index_items_on_guid_and_feed_id", unique: true
  end

  create_table "settings", force: :cascade do |t|
    t.string "filter", default: "all", null: false
    t.string "selection_type"
    t.integer "selection_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["selection_type", "selection_id"], name: "index_settings_on_selection"
  end

  add_foreign_key "feeds", "folders"
  add_foreign_key "items", "feeds"
end
