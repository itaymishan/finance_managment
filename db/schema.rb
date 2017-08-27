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

ActiveRecord::Schema.define(version: 20170810224936) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string   "english_name"
    t.string   "hebrew_name"
    t.boolean  "luxury"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.boolean  "active",       default: true, null: false
  end

  create_table "currencies", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "exchange_rates", force: :cascade do |t|
    t.string   "from",       null: false
    t.string   "to",         null: false
    t.decimal  "rate",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "expenses", force: :cascade do |t|
    t.integer  "year"
    t.integer  "month"
    t.integer  "category_id"
    t.integer  "expense_type"
    t.integer  "user_id"
    t.decimal  "amount",                       null: false
    t.integer  "currency_id",                  null: false
    t.text     "comments"
    t.boolean  "luxury",       default: false
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.date     "date"
  end

  add_index "expenses", ["category_id"], name: "index_expenses_on_category_id", using: :btree
  add_index "expenses", ["currency_id"], name: "index_expenses_on_currency_id", using: :btree
  add_index "expenses", ["user_id"], name: "index_expenses_on_user_id", using: :btree

  create_table "income_sources", force: :cascade do |t|
    t.string   "name",                       null: false
    t.boolean  "active",      default: true, null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "hebrew_name"
  end

  create_table "incomes", force: :cascade do |t|
    t.integer  "income_source_id"
    t.decimal  "amount",           null: false
    t.text     "comments"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "year",             null: false
    t.integer  "month",            null: false
    t.integer  "currency_id",      null: false
    t.date     "date"
  end

  add_index "incomes", ["currency_id"], name: "index_incomes_on_currency_id", using: :btree
  add_index "incomes", ["income_source_id"], name: "index_incomes_on_income_source_id", using: :btree

  create_table "old_expenses", force: :cascade do |t|
    t.string   "old_id"
    t.string   "insert_date"
    t.string   "month"
    t.string   "year"
    t.string   "category"
    t.string   "person"
    t.string   "expense_type"
    t.string   "amount"
    t.string   "is_luxury"
    t.string   "comments"
    t.string   "currency"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.boolean  "exported",     default: false
  end

  create_table "old_incomes", force: :cascade do |t|
    t.string   "old_id"
    t.string   "year"
    t.string   "month"
    t.string   "income_src"
    t.string   "amount"
    t.string   "comments"
    t.string   "currency"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "taggings", force: :cascade do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       limit: 128
    t.datetime "created_at"
  end

  add_index "taggings", ["context"], name: "index_taggings_on_context", using: :btree
  add_index "taggings", ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true, using: :btree
  add_index "taggings", ["tag_id"], name: "index_taggings_on_tag_id", using: :btree
  add_index "taggings", ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context", using: :btree
  add_index "taggings", ["taggable_id", "taggable_type", "tagger_id", "context"], name: "taggings_idy", using: :btree
  add_index "taggings", ["taggable_id"], name: "index_taggings_on_taggable_id", using: :btree
  add_index "taggings", ["taggable_type"], name: "index_taggings_on_taggable_type", using: :btree
  add_index "taggings", ["tagger_id", "tagger_type"], name: "index_taggings_on_tagger_id_and_tagger_type", using: :btree
  add_index "taggings", ["tagger_id"], name: "index_taggings_on_tagger_id", using: :btree

  create_table "tags", force: :cascade do |t|
    t.string  "name"
    t.integer "taggings_count", default: 0
  end

  add_index "tags", ["name"], name: "index_tags_on_name", unique: true, using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "work_expense_ins", force: :cascade do |t|
    t.string   "old_id"
    t.string   "amount"
    t.string   "currency"
    t.string   "comments"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "work_expense_outs", force: :cascade do |t|
    t.string   "old_id"
    t.string   "amount"
    t.string   "currency"
    t.string   "comments"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
