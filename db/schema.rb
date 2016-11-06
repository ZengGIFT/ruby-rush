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

ActiveRecord::Schema.define(version: 20161106061145) do

  create_table "minerals", force: :cascade do |t|
    t.integer  "minerals_cart_id"
    t.integer  "rubies_inside_mineral"
    t.string   "title",                 default: ""
    t.boolean  "is_selected",           default: false
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  create_table "minerals_carts", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "rubies_incart", default: 0
    t.string   "aasm_state",    default: "new_cart"
    t.text     "comment"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.index ["aasm_state"], name: "index_minerals_carts_on_aasm_state"
  end

  create_table "posts", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "user_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "total_rubies", default: 0
  end

  create_table "ptasks", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "reward"
    t.boolean  "is_hidden",   default: true
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.boolean  "is_admin",               default: false
    t.boolean  "is_actived",             default: false
    t.integer  "pickax_amount",          default: 10
    t.integer  "ruby_amount",            default: 10
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "votes", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "post_id"
    t.integer  "rubys"
    t.text     "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
