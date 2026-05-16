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

ActiveRecord::Schema[8.1].define(version: 2026_05_16_010201) do
  create_table "companies", force: :cascade do |t|
    t.string "country"
    t.datetime "created_at", null: false
    t.string "name"
    t.datetime "updated_at", null: false
    t.string "vat_number"
  end

  create_table "invoices", force: :cascade do |t|
    t.integer "company_id", null: false
    t.datetime "created_at", null: false
    t.datetime "issued_at"
    t.string "status"
    t.integer "subtotal_cents"
    t.integer "total_cents"
    t.datetime "updated_at", null: false
    t.integer "vat_cents"
    t.index ["company_id"], name: "index_invoices_on_company_id"
  end

  create_table "subscriptions", force: :cascade do |t|
    t.integer "base_price_cents"
    t.integer "company_id", null: false
    t.datetime "created_at", null: false
    t.integer "included_usage"
    t.integer "overage_rate_cents"
    t.string "plan_name"
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_subscriptions_on_company_id"
  end

  create_table "usage_records", force: :cascade do |t|
    t.string "action_type"
    t.integer "company_id", null: false
    t.datetime "created_at", null: false
    t.integer "quantity"
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_usage_records_on_company_id"
  end

  add_foreign_key "invoices", "companies"
  add_foreign_key "subscriptions", "companies"
  add_foreign_key "usage_records", "companies"
end
