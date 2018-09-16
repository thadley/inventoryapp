class CreateInventories < ActiveRecord::Migration[5.2]
  def change
    create_table :inventories do |t|
      t.string :category
      t.string :sub_category
      t.string :budget_sub_category
      t.string :product_name
      t.string :product_description
      t.string :brand
      t.numeric :current_unit_cost, precision: 6, scale: 2
      t.integer :warehoused_quantity

      t.timestamps
    end
  end
end
