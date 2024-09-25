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

ActiveRecord::Schema[7.0].define(version: 2024_09_24_120108) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "game_scores", force: :cascade do |t|
    t.integer "game_points"
    t.integer "user_id"
    t.integer "game_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_game_scores_on_game_id"
    t.index ["user_id"], name: "index_game_scores_on_user_id"
  end

  create_table "games", force: :cascade do |t|
    t.string "name"
    t.string "themes", default: [], array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sentences", force: :cascade do |t|
    t.string "sentence"
    t.string "translation"
    t.string "themes", default: [], array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sentences_words", id: false, force: :cascade do |t|
    t.bigint "word_id", null: false
    t.bigint "sentence_id", null: false
    t.integer "order"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "username"
    t.string "password_digest"
    t.boolean "admin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "verb_tenses", force: :cascade do |t|
    t.string "name"
    t.integer "verb_id"
    t.integer "yo_id"
    t.integer "tu_id"
    t.integer "el_id"
    t.integer "nosotros_id"
    t.integer "ellos_id"
    t.integer "participle_id"
    t.string "themes", default: [], array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "words", force: :cascade do |t|
    t.string "word"
    t.string "translation"
    t.boolean "type_verb", default: false
    t.string "themes", default: [], array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "verb_id"
    t.index ["verb_id"], name: "index_words_on_verb_id"
  end

  add_foreign_key "game_scores", "games"
  add_foreign_key "game_scores", "users"
  add_foreign_key "words", "words", column: "verb_id"
end
