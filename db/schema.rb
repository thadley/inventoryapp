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

ActiveRecord::Schema.define(version: 2018_09_16_225221) do

  create_table "carts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "inventories", force: :cascade do |t|
    t.string "category"
    t.string "sub_category"
    t.string "budget_sub_category"
    t.string "product_name"
    t.string "product_description"
    t.string "brand"
    t.decimal "current_unit_cost", precision: 6, scale: 2
    t.integer "warehoused_quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "inventories_properties", id: false, force: :cascade do |t|
    t.integer "inventory_id", null: false
    t.integer "property_id", null: false
    t.index ["inventory_id", "property_id"], name: "index_inventories_properties_on_inventory_id_and_property_id"
  end

  create_table "properties", force: :cascade do |t|
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "activation_date"
    t.date "deactivation_date"
  end

end
