require 'test_helper'

class DimCustomersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @dim_customer = dim_customers(:one)
  end

  test "should get index" do
    get dim_customers_url
    assert_response :success
  end

  test "should get new" do
    get new_dim_customer_url
    assert_response :success
  end

  test "should create dim_customer" do
    assert_difference('DimCustomer.count') do
      post dim_customers_url, params: { dim_customer: {  } }
    end

    assert_redirected_to dim_customer_url(DimCustomer.last)
  end

  test "should show dim_customer" do
    get dim_customer_url(@dim_customer)
    assert_response :success
  end

  test "should get edit" do
    get edit_dim_customer_url(@dim_customer)
    assert_response :success
  end

  test "should update dim_customer" do
    patch dim_customer_url(@dim_customer), params: { dim_customer: {  } }
    assert_redirected_to dim_customer_url(@dim_customer)
  end

  test "should destroy dim_customer" do
    assert_difference('DimCustomer.count', -1) do
      delete dim_customer_url(@dim_customer)
    end

    assert_redirected_to dim_customers_url
  end
end
