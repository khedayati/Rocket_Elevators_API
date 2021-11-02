require "application_system_test_case"

class CustomersTest < ApplicationSystemTestCase
  setup do
    @customer = customers(:one)
  end

  test "visiting the index" do
    visit customers_url
    assert_selector "h1", text: "Customers"
  end

  test "creating a Customer" do
    visit customers_url
    click_on "New Customer"

    fill_in "Company contact", with: @customer.company_contact
    fill_in "Company contact phone", with: @customer.company_contact_phone
    fill_in "Company description", with: @customer.company_description
    fill_in "Company headquarters address", with: @customer.company_headquarters_address
    fill_in "Company name", with: @customer.company_name
    fill_in "Contact", with: @customer.contact
    fill_in "Customer creation date", with: @customer.customer_creation_date
    fill_in "Email of the", with: @customer.email_of_the
    fill_in "Full name of", with: @customer.full_name_of
    fill_in "Full name of the company", with: @customer.full_name_of_the_company
    fill_in "Service", with: @customer.service
    fill_in "Service technical authority", with: @customer.service_technical_authority
    fill_in "Technical authority phone for", with: @customer.technical_authority_phone_for
    fill_in "Technical manager email for service", with: @customer.technical_manager_email_for_service
    fill_in "User", with: @customer.user_id
    click_on "Create Customer"

    assert_text "Customer was successfully created"
    click_on "Back"
  end

  test "updating a Customer" do
    visit customers_url
    click_on "Edit", match: :first

    fill_in "Company contact", with: @customer.company_contact
    fill_in "Company contact phone", with: @customer.company_contact_phone
    fill_in "Company description", with: @customer.company_description
    fill_in "Company headquarters address", with: @customer.company_headquarters_address
    fill_in "Company name", with: @customer.company_name
    fill_in "Contact", with: @customer.contact
    fill_in "Customer creation date", with: @customer.customer_creation_date
    fill_in "Email of the", with: @customer.email_of_the
    fill_in "Full name of", with: @customer.full_name_of
    fill_in "Full name of the company", with: @customer.full_name_of_the_company
    fill_in "Service", with: @customer.service
    fill_in "Service technical authority", with: @customer.service_technical_authority
    fill_in "Technical authority phone for", with: @customer.technical_authority_phone_for
    fill_in "Technical manager email for service", with: @customer.technical_manager_email_for_service
    fill_in "User", with: @customer.user_id
    click_on "Update Customer"

    assert_text "Customer was successfully updated"
    click_on "Back"
  end

  test "destroying a Customer" do
    visit customers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Customer was successfully destroyed"
  end
end
