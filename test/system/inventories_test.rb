require "application_system_test_case"

class InventoriesTest < ApplicationSystemTestCase
  setup do
    @inventory = inventories(:one)
  end

  test "visiting the index" do
    visit inventories_url
    assert_selector "h1", text: "Inventories"
  end

  test "creating a Inventory" do
    visit inventories_url
    click_on "New Inventory"

    fill_in "Brand", with: @inventory.brand
    fill_in "Budget Sub Category", with: @inventory.budget_sub_category
    fill_in "Category", with: @inventory.category
    fill_in "Current Unit Cost", with: @inventory.current_unit_cost
    fill_in "Product Description", with: @inventory.product_description
    fill_in "Product Name", with: @inventory.product_name
    fill_in "Sub Category", with: @inventory.sub_category
    fill_in "Warehoused Quantity", with: @inventory.warehoused_quantity
    click_on "Create Inventory"

    assert_text "Inventory was successfully created"
    click_on "Back"
  end

  test "updating a Inventory" do
    visit inventories_url
    click_on "Edit", match: :first

    fill_in "Brand", with: @inventory.brand
    fill_in "Budget Sub Category", with: @inventory.budget_sub_category
    fill_in "Category", with: @inventory.category
    fill_in "Current Unit Cost", with: @inventory.current_unit_cost
    fill_in "Product Description", with: @inventory.product_description
    fill_in "Product Name", with: @inventory.product_name
    fill_in "Sub Category", with: @inventory.sub_category
    fill_in "Warehoused Quantity", with: @inventory.warehoused_quantity
    click_on "Update Inventory"

    assert_text "Inventory was successfully updated"
    click_on "Back"
  end

  test "destroying a Inventory" do
    visit inventories_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Inventory was successfully destroyed"
  end
end
