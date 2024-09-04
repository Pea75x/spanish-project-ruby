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

ActiveRecord::Schema[7.0].define(version: 2024_09_04_102608) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

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
  end

  create_table "verbs", force: :cascade do |t|
    t.string "verb"
    t.string "translation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "words", force: :cascade do |t|
    t.string "word"
    t.string "translation"
    t.string "themes", default: [], array: true
    t.bigint "verb_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
