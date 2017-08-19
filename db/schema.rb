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

ActiveRecord::Schema.define(version: 20170819052441) do

  create_table "event_owners", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "user_id"
    t.bigint "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_event_owners_on_event_id"
    t.index ["user_id", "event_id"], name: "index_event_owners_on_user_id_and_event_id", unique: true
    t.index ["user_id"], name: "index_event_owners_on_user_id"
  end

  create_table "events", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "title"
    t.text "description"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "participant_public_flg", default: true, null: false
    t.text "content"
    t.datetime "start_time"
    t.datetime "end_time"
  end

  create_table "participants", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "user_id"
    t.bigint "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "kicked_out_at"
    t.datetime "canceled_at"
    t.string "comment"
    t.bigint "ticket_id"
    t.index ["event_id"], name: "index_participants_on_event_id"
    t.index ["ticket_id"], name: "index_participants_on_ticket_id"
    t.index ["user_id", "event_id"], name: "index_participants_on_user_id_and_event_id", unique: true
    t.index ["user_id"], name: "index_participants_on_user_id"
  end

  create_table "tickets", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "event_id"
    t.string "name"
    t.integer "price"
    t.integer "capacity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_tickets_on_event_id"
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "event_owners", "events"
  add_foreign_key "event_owners", "users"
  add_foreign_key "participants", "events"
  add_foreign_key "participants", "tickets"
  add_foreign_key "participants", "users"
  add_foreign_key "tickets", "events"
end
