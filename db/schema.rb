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

ActiveRecord::Schema.define(version: 2019_10_15_133358) do

  create_table "actions", force: :cascade do |t|
    t.integer "user_id"
    t.integer "habit_id"
    t.string "action_step"
    t.string "start_datetime"
    t.string "location"
    t.time "action_time"
    t.string "day"
    t.integer "duration_number"
    t.string "duration_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "comments", force: :cascade do |t|
    t.integer "user_id"
    t.text "content"
    t.string "commentable_type"
    t.integer "commentable_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["commentable_type", "commentable_id"], name: "index_comments_on_commentable_type_and_commentable_id"
  end

  create_table "habits", force: :cascade do |t|
    t.boolean "build", default: true
    t.string "title"
    t.integer "frequency_number"
    t.string "frequency"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "identities", force: :cascade do |t|
    t.string "pact_name"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "identity_habits", force: :cascade do |t|
    t.integer "identity_id"
    t.integer "habit_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "reactions", force: :cascade do |t|
    t.integer "user_id"
    t.string "reactable_type"
    t.integer "reactable_id"
    t.integer "reaction_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["reactable_type", "reactable_id"], name: "index_reactions_on_reactable_type_and_reactable_id"
  end

  create_table "streaks", force: :cascade do |t|
    t.integer "habit_id"
    t.integer "user_id"
    t.integer "current_streak"
    t.integer "longest_streak"
    t.datetime "longest_streak_end_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "user_identities", force: :cascade do |t|
    t.integer "user_id"
    t.integer "identity_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "google_token"
    t.string "google_refresh_token"
    t.string "name"
    t.string "email"
    t.string "username"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
