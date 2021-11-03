require "application_system_test_case"

class DimCustomersTest < ApplicationSystemTestCase
  setup do
    @dim_customer = dim_customers(:one)
  end

  test "visiting the index" do
    visit dim_customers_url
    assert_selector "h1", text: "Dim Customers"
  end

  test "creating a Dim customer" do
    visit dim_customers_url
    click_on "New Dim Customer"

    click_on "Create Dim customer"

    assert_text "Dim customer was successfully created"
    click_on "Back"
  end

  test "updating a Dim customer" do
    visit dim_customers_url
    click_on "Edit", match: :first

    click_on "Update Dim customer"

    assert_text "Dim customer was successfully updated"
    click_on "Back"
  end

  test "destroying a Dim customer" do
    visit dim_customers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Dim customer was successfully destroyed"
  end
end
