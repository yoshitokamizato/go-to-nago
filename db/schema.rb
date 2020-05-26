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

ActiveRecord::Schema.define(version: 2020_05_23_134648) do

  create_table "bookmarks", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id"
    t.bigint "facility_id"
    t.index ["facility_id"], name: "index_bookmarks_on_facility_id"
    t.index ["user_id"], name: "index_bookmarks_on_user_id"
  end

  create_table "facilities", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "type", null: false
    t.string "name", null: false
    t.integer "postal_code", null: false
    t.string "address", null: false
    t.float "latitude", null: false
    t.float "longitude", null: false
    t.string "running_time"
    t.string "tel"
    t.string "email"
    t.integer "budget"
    t.text "description", null: false
    t.text "advice"
    t.datetime "first_open"
    t.datetime "first_close"
    t.datetime "last_open"
    t.datetime "last_close"
    t.string "holiday"
    t.string "parking", null: false
    t.string "home_page"
    t.integer "owner_id"
    t.string "instagram"
    t.string "twitter"
    t.string "youtube"
    t.integer "status"
    t.integer "created_user", null: false
    t.integer "updated_user", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id"
  end

  create_table "facility_genres", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "facility_id"
    t.bigint "genre_id"
    t.index ["facility_id"], name: "index_facility_genres_on_facility_id"
    t.index ["genre_id"], name: "index_facility_genres_on_genre_id"
  end

  create_table "facility_images", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "facility_id"
    t.string "image", null: false
    t.integer "order", null: false
    t.integer "created_user", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "genres", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "menus", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "facility_id"
    t.string "name", null: false
    t.integer "price", null: false
    t.string "image", null: false
    t.text "content", null: false
    t.integer "created_user", null: false
    t.integer "updated_user", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "nickname", null: false
    t.datetime "birth_year", null: false
    t.integer "sex"
    t.integer "prefecture"
    t.string "image"
    t.integer "role"
    t.text "profile"
    t.integer "status"
    t.string "password"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "bookmarks", "facilities"
  add_foreign_key "facility_genres", "genres"
end
