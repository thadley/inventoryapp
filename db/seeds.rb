# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

# Seed database with inventory and properties data from google sheets
# Run rails db:seed or rake db:seed from terminal
# Full db setup: rake db:drop && rake db:create && rake db:migrate && rake db:seed

require 'csv'

inventory_data = CSV.read('inventory_data.csv', { encoding: "UTF-8", headers: true, converters: :all})
hashed_inventory_data = inventory_data.map { |d| d.to_hash }

hashed_inventory_data.each do |i|
  Inventory.create(
    category: i['Category'],
    sub_category: i['Sub-category'],
    budget_sub_category: i['Budget Sub-Category'],
    product_name: i['Product Name'],
    product_description: i['Product Description'],
    brand: i['Brand'],
    current_unit_cost: i['Current Unit Cost'],
    warehoused_quantity: i['Warehoused Quantity (DNE)']
  )
end

properties_data = CSV.read('properties_data.csv', { encoding: "UTF-8", headers: true, converters: :all})
hashed_properties_data = properties_data.map { |d| d.to_hash }

hashed_properties_data.each do |i|
  Property.create(
    address: i['property'],
    activation_date: i['activation_date'],
    deactivation_date: i['deactivation_date'])
end
