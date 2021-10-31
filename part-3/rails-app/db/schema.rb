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

ActiveRecord::Schema.define(version: 2021_10_21_164238) do

  create_table "invitations", force: :cascade do |t|
    t.integer "report_id"
    t.string "sender_type"
    t.integer "sender_id"
    t.string "recipient_email"
    t.string "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["report_id", "recipient_email"], name: "index_invitations_on_report_id_and_recipient_email", unique: true
    t.index ["report_id"], name: "index_invitations_on_report_id"
    t.index ["sender_type", "sender_id"], name: "index_invitations_on_sender"
  end

  create_table "reports", force: :cascade do |t|
    t.boolean "active"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
