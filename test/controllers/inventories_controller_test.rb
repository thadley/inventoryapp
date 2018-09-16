require 'test_helper'

class InventoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @inventory = inventories(:one)
  end

  test "should get index" do
    get inventories_url
    assert_response :success
  end

  test "should get new" do
    get new_inventory_url
    assert_response :success
  end

  test "should create inventory" do
    assert_difference('Inventory.count') do
      post inventories_url, params: { inventory: { brand: @inventory.brand, budget_sub_category: @inventory.budget_sub_category, category: @inventory.category, current_unit_cost: @inventory.current_unit_cost, product_description: @inventory.product_description, product_name: @inventory.product_name, sub_category: @inventory.sub_category, warehoused_quantity: @inventory.warehoused_quantity } }
    end

    assert_redirected_to inventory_url(Inventory.last)
  end

  test "should show inventory" do
    get inventory_url(@inventory)
    assert_response :success
  end

  test "should get edit" do
    get edit_inventory_url(@inventory)
    assert_response :success
  end

  test "should update inventory" do
    patch inventory_url(@inventory), params: { inventory: { brand: @inventory.brand, budget_sub_category: @inventory.budget_sub_category, category: @inventory.category, current_unit_cost: @inventory.current_unit_cost, product_description: @inventory.product_description, product_name: @inventory.product_name, sub_category: @inventory.sub_category, warehoused_quantity: @inventory.warehoused_quantity } }
    assert_redirected_to inventory_url(@inventory)
  end

  test "should destroy inventory" do
    assert_difference('Inventory.count', -1) do
      delete inventory_url(@inventory)
    end

    assert_redirected_to inventories_url
  end
end
