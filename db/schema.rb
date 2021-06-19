# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_06_19_121939) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "games", force: :cascade do |t|
    t.bigint "player_id"
    t.bigint "level_id"
    t.boolean "active", default: true
    t.integer "player_health", default: 100
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "situation_id"
    t.string "message"
    t.index ["level_id"], name: "index_games_on_level_id"
    t.index ["player_id"], name: "index_games_on_player_id"
    t.index ["situation_id"], name: "index_games_on_situation_id"
  end

  create_table "levels", force: :cascade do |t|
    t.integer "position", default: 0
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "players", force: :cascade do |t|
    t.string "handle"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "situations", force: :cascade do |t|
    t.bigint "level_id"
    t.string "description"
    t.integer "health_change"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["level_id"], name: "index_situations_on_level_id"
  end

  add_foreign_key "games", "levels"
  add_foreign_key "games", "players"
  add_foreign_key "games", "situations"
  add_foreign_key "situations", "levels"
end
