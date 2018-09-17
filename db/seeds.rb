# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

# Seed database with inventory and properties data from google sheets
# Run rails db:seed or rake db:seed from terminal
# Full db setup: rake db:drop && rake db:create && rake db:migrate && rake db:seed

require 'csv'

properties_data = CSV.read('properties_data.csv', { encoding: "UTF-8", headers: true, converters: :all})
hashed_properties_data = properties_data.map { |d| d.to_hash }

hashed_properties_data.each do |i|
  Property.create(
    address: i['property'],
    activation_date: i['activation_date'],
    deactivation_date: i['deactivation_date'])
end

inventory_data = CSV.read('inventory_data.csv', { encoding: "UTF-8", headers: true, converters: :all})
hashed_inventory_data = inventory_data.map { |d| d.to_hash }
property_column_headers = [
  '68 West Willetta',
  '1102 West Turney',
  '1301 W. 14th Street #14',
  '1301 W. 14th Street #15',
  '639 N. 5th Avenue',
  '4142 25th Street #21',
  '846 N. 2nd Avenue #2A',
  '1128 Grand Avenue unit #B201'
]

hashed_inventory_data.each do |i|
  current_unit_cost = i['Current Unit Cost'] ? BigDecimal.new(i['Current Unit Cost'].to_s.tr('$', '')) : nil

  inventory = Inventory.create(
    category: i['Category'],
    sub_category: i['Sub-Category'],
    budget_sub_category: i['Budget Sub-Category'],
    product_name: i['Product Name'],
    product_description: i['Product Description'],
    brand: i['Brand'],
    current_unit_cost: current_unit_cost,
    warehoused_quantity: i['Warehoused Quantity (DNE)']
  )

  property_column_headers.each do |property_column|
    if i[property_column]
      property = Property.find_by(address: property_column.to_s)
      (1..i[property_column].to_i).each do |one_item|
        inventory.properties << property
        inventory.save!
      end
    end
  end
end
