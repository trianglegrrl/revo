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

ActiveRecord::Schema.define(version: 2018_12_09_153240) do

  create_table "action_steps", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "default_user_action_steps", force: :cascade do |t|
    t.text "action_step_ids"
    t.datetime "starting_at"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_default_user_action_steps_on_user_id"
  end

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer "priority", default: 0, null: false
    t.integer "attempts", default: 0, null: false
    t.text "handler", null: false
    t.text "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string "locked_by"
    t.string "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["priority", "run_at"], name: "delayed_jobs_priority"
  end

  create_table "fido_usf_devices", force: :cascade do |t|
    t.string "user_type", null: false
    t.integer "user_id", null: false
    t.string "name", default: "", null: false
    t.string "key_handle", limit: 255, default: "", null: false
    t.binary "public_key", limit: 10240, null: false
    t.binary "certificate", limit: 1048576, null: false
    t.integer "counter", default: 0, null: false
    t.datetime "last_authenticated_at", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["key_handle"], name: "index_fido_usf_devices_on_key_handle"
    t.index ["last_authenticated_at"], name: "index_fido_usf_devices_on_last_authenticated_at"
    t.index ["user_type", "user_id"], name: "index_fido_usf_devices_on_user_type_and_user_id"
  end

  create_table "foods", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "serving_type"
    t.float "carbs"
    t.float "fat"
    t.float "protein"
    t.float "calories"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "meal_items", force: :cascade do |t|
    t.integer "food_id"
    t.integer "user_id"
    t.float "servings"
    t.datetime "eaten_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["food_id"], name: "index_meal_items_on_food_id"
    t.index ["user_id"], name: "index_meal_items_on_user_id"
  end

  create_table "user_action_steps", force: :cascade do |t|
    t.integer "user_id"
    t.integer "action_step_id"
    t.datetime "active_date"
    t.datetime "expiration_date"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "completed_at"
    t.index ["action_step_id"], name: "index_user_action_steps_on_action_step_id"
    t.index ["user_id"], name: "index_user_action_steps_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.boolean "public"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "encrypted_password", default: ""
    t.string "reset_password_token", default: ""
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.string "encrypted_otp_secret"
    t.string "encrypted_otp_secret_iv"
    t.string "encrypted_otp_secret_salt"
    t.integer "consumed_timestep"
    t.boolean "otp_required_for_login"
    t.boolean "admin", default: false
    t.boolean "coach", default: false
    t.boolean "check_in", default: false
    t.boolean "leaderboard", default: false
    t.boolean "client", default: false
    t.datetime "completed_at"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["first_name"], name: "index_users_on_first_name"
    t.index ["last_name"], name: "index_users_on_last_name"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token"
    t.index ["unlock_token"], name: "index_users_on_unlock_token"
  end

end
