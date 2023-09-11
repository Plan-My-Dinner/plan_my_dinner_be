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

ActiveRecord::Schema[7.0].define(version: 2023_09_10_204248) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "saved_recipes", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.integer "api_recipe_id", null: false
    t.boolean "favorited", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_saved_recipes_on_user_id"
  end

  create_table "scheduled_recipes", force: :cascade do |t|
    t.bigint "saved_recipe_id", null: false
    t.datetime "scheduled_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["saved_recipe_id"], name: "index_scheduled_recipes_on_saved_recipe_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "saved_recipes", "users"
  add_foreign_key "scheduled_recipes", "saved_recipes"
end
