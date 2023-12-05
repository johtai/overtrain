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

ActiveRecord::Schema[7.0].define(version: 2023_12_01_115339) do
  create_table "gamemodes", force: :cascade do |t|
    t.string "key"
    t.string "name"
    t.string "icon"
    t.string "desc"
    t.string "screenshot"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "heroes", force: :cascade do |t|
    t.string "hero_id"
    t.string "name"
    t.string "desc"
    t.string "portrait"
    t.string "role"
    t.string "location"
    t.json "hitpoints"
    t.json "abilities"
    t.json "story"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "maps", force: :cascade do |t|
    t.string "name"
    t.string "screenshot"
    t.json "gamemodes"
    t.string "location"
    t.string "country_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "players", force: :cascade do |t|
    t.float "kda"
    t.float "winrate"
    t.float "avg_elim"
    t.float "avg_ass"
    t.float "avg_death"
    t.float "avg_dam"
    t.float "avg_heal"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "player_id"
    t.datetime "dump_date", precision: nil
  end

  create_table "subscriptions", force: :cascade do |t|
    t.string "user_id"
    t.string "player_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
  end

end
