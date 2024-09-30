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

ActiveRecord::Schema[7.2].define(version: 2024_09_30_130453) do
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

  create_table "refresh_states", force: :cascade do |t|
    t.integer "feed_id", null: false
    t.datetime "refreshed_at"
    t.string "state", null: false
    t.text "error"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["feed_id"], name: "index_refresh_states_on_feed_id"
  end

  create_table "settings", force: :cascade do |t|
    t.string "filter", default: "all", null: false
    t.string "selection_type"
    t.integer "selection_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["selection_type", "selection_id"], name: "index_settings_on_selection"
  end

  create_table "solid_cache_entries", force: :cascade do |t|
    t.binary "key", limit: 1024, null: false
    t.binary "value", limit: 536870912, null: false
    t.datetime "created_at", null: false
    t.integer "key_hash", limit: 8, null: false
    t.integer "byte_size", limit: 4, null: false
    t.index ["byte_size"], name: "index_solid_cache_entries_on_byte_size"
    t.index ["key_hash", "byte_size"], name: "index_solid_cache_entries_on_key_hash_and_byte_size"
    t.index ["key_hash"], name: "index_solid_cache_entries_on_key_hash", unique: true
  end

  add_foreign_key "feeds", "folders"
  add_foreign_key "items", "feeds"
  add_foreign_key "refresh_states", "feeds"
end
