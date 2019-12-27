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

ActiveRecord::Schema.define(version: 20191224164307) do

  create_table "invests", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.decimal "amount", precision: 20, scale: 6
    t.date "selected_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "nav_data", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "scheme_code"
    t.string "scheme_name"
    t.string "ISIN_growth"
    t.string "ISIN_div_reinvestment"
    t.decimal "net_asset_value", precision: 20, scale: 6
    t.decimal "repurchase_price", precision: 20, scale: 6
    t.decimal "sale_price", precision: 20, scale: 6
    t.date "current_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
