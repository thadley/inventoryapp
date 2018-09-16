json.extract! inventory, :id, :category, :sub_category, :budget_sub_category, :product_name, :product_description, :brand, :current_unit_cost, :warehoused_quantity, :created_at, :updated_at
json.url inventory_url(inventory, format: :json)
