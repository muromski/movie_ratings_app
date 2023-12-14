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

ActiveRecord::Schema[7.1].define(version: 2023_12_14_071712) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "movies", force: :cascade do |t|
    t.string "title", null: false
    t.string "director", null: false
    t.integer "release_year", null: false
    t.string "description", null: false
    t.string "genre", null: false
    t.float "rating"
    t.integer "reviews_count", default: 0, null: false
    t.string "image_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["director"], name: "index_movies_on_director"
    t.index ["title"], name: "index_movies_on_title"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "rating", null: false
    t.text "comment"
    t.bigint "user_id", null: false
    t.bigint "movie_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["movie_id"], name: "index_reviews_on_movie_id"
    t.index ["user_id", "movie_id"], name: "index_reviews_on_user_id_and_movie_id", unique: true
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "nickname", null: false
    t.string "about", null: false
    t.string "avatar_url", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "reviews", "movies"
  add_foreign_key "reviews", "users"
end
