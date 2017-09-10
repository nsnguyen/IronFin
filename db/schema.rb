# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170910220256) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "actors", force: :cascade do |t|
    t.integer "actor_id", null: false
    t.string "last", limit: 20
    t.string "first", limit: 20
    t.string "sex", limit: 6
    t.datetime "dob", null: false
    t.datetime "dod"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["id"], name: "index_actors_on_id"
  end

  create_table "directors", force: :cascade do |t|
    t.integer "director_id", null: false
    t.string "last", limit: 20
    t.string "first", limit: 20
    t.datetime "dob", null: false
    t.datetime "dod"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["id"], name: "index_directors_on_id"
  end

  create_table "movie_actors", force: :cascade do |t|
    t.integer "movie_id"
    t.integer "actor_id"
    t.string "role", limit: 50
    t.bigint "movies_id"
    t.bigint "actors_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["actors_id"], name: "index_movie_actors_on_actors_id"
    t.index ["movies_id"], name: "index_movie_actors_on_movies_id"
  end

  create_table "movie_directors", force: :cascade do |t|
    t.integer "movie_id"
    t.integer "director_id"
    t.bigint "movies_id"
    t.bigint "directors_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["directors_id"], name: "index_movie_directors_on_directors_id"
    t.index ["movies_id"], name: "index_movie_directors_on_movies_id"
  end

  create_table "movie_genres", force: :cascade do |t|
    t.integer "mid", null: false
    t.string "genre", limit: 20
    t.bigint "movie_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["mid"], name: "index_movie_genres_on_mid"
    t.index ["movie_id"], name: "index_movie_genres_on_movie_id"
  end

  create_table "movies", force: :cascade do |t|
    t.integer "movie_id", null: false
    t.string "title", limit: 100, null: false
    t.integer "year"
    t.string "rating", limit: 10
    t.string "company", limit: 50
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["id", "title"], name: "index_movies_on_id_and_title"
  end

  create_table "reviews", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "time", null: false
    t.integer "movie_id"
    t.integer "rating"
    t.string "comment", limit: 500
    t.bigint "Movie_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["Movie_id"], name: "index_reviews_on_Movie_id"
  end

  add_foreign_key "movie_actors", "actors", on_update: :cascade, on_delete: :cascade
  add_foreign_key "movie_actors", "movies", on_update: :cascade, on_delete: :cascade
  add_foreign_key "movie_directors", "directors", on_update: :cascade, on_delete: :cascade
  add_foreign_key "movie_directors", "movies", on_update: :cascade, on_delete: :cascade
  add_foreign_key "movie_genres", "movies", on_update: :cascade, on_delete: :cascade
  add_foreign_key "reviews", "movies", on_update: :cascade, on_delete: :cascade
end
