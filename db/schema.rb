# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20151104231757) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "dinners", force: :cascade do |t|
    t.datetime "date"
    t.integer  "host_id"
    t.string   "title"
  end

  create_table "dish_assignments", force: :cascade do |t|
    t.integer "guest_id"
    t.integer "menu_item_id"
  end

  create_table "dishes", force: :cascade do |t|
    t.string "name"
    t.string "course"
  end

  create_table "guests", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "hosts", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "invitations", force: :cascade do |t|
    t.integer "dinner_id"
    t.integer "guest_id"
    t.string  "status",    default: "pending"
  end

  create_table "menu_items", force: :cascade do |t|
    t.integer "dish_id"
    t.integer "dinner_id"
    t.string  "recipe_title"
    t.string  "recipe_url"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "uid"
    t.string "provider"
    t.string "email"
    t.string "password_digest"
    t.string "profile_picture"
  end

end
