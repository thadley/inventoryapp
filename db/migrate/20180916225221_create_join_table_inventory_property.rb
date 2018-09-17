class CreateJoinTableInventoryProperty < ActiveRecord::Migration[5.2]
  def change
    create_join_table :inventories, :properties do |t|
      t.index [:inventory_id, :property_id]
    end
  end
end
