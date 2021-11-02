require 'test_helper'

class CustomersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @customer = customers(:one)
  end

  test "should get index" do
    get customers_url
    assert_response :success
  end

  test "should get new" do
    get new_customer_url
    assert_response :success
  end

  test "should create customer" do
    assert_difference('Customer.count') do
      post customers_url, params: { customer: { company_contact: @customer.company_contact, company_contact_phone: @customer.company_contact_phone, company_description: @customer.company_description, company_headquarters_address: @customer.company_headquarters_address, company_name: @customer.company_name, contact: @customer.contact, customer_creation_date: @customer.customer_creation_date, email_of_the: @customer.email_of_the, full_name_of: @customer.full_name_of, full_name_of_the_company: @customer.full_name_of_the_company, service: @customer.service, service_technical_authority: @customer.service_technical_authority, technical_authority_phone_for: @customer.technical_authority_phone_for, technical_manager_email_for_service: @customer.technical_manager_email_for_service, user: @customer.user } }
    end

    assert_redirected_to customer_url(Customer.last)
  end

  test "should show customer" do
    get customer_url(@customer)
    assert_response :success
  end

  test "should get edit" do
    get edit_customer_url(@customer)
    assert_response :success
  end

  test "should update customer" do
    patch customer_url(@customer), params: { customer: { company_contact: @customer.company_contact, company_contact_phone: @customer.company_contact_phone, company_description: @customer.company_description, company_headquarters_address: @customer.company_headquarters_address, company_name: @customer.company_name, contact: @customer.contact, customer_creation_date: @customer.customer_creation_date, email_of_the: @customer.email_of_the, full_name_of: @customer.full_name_of, full_name_of_the_company: @customer.full_name_of_the_company, service: @customer.service, service_technical_authority: @customer.service_technical_authority, technical_authority_phone_for: @customer.technical_authority_phone_for, technical_manager_email_for_service: @customer.technical_manager_email_for_service, user: @customer.user } }
    assert_redirected_to customer_url(@customer)
  end

  test "should destroy customer" do
    assert_difference('Customer.count', -1) do
      delete customer_url(@customer)
    end

    assert_redirected_to customers_url
  end
end
