require 'test_helper'

class FactQuotesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @fact_quote = fact_quotes(:one)
  end

  test "should get index" do
    get fact_quotes_url
    assert_response :success
  end

  test "should get new" do
    get new_fact_quote_url
    assert_response :success
  end

  test "should create fact_quote" do
    assert_difference('FactQuote.count') do
      post fact_quotes_url, params: { fact_quote: {  } }
    end

    assert_redirected_to fact_quote_url(FactQuote.last)
  end

  test "should show fact_quote" do
    get fact_quote_url(@fact_quote)
    assert_response :success
  end

  test "should get edit" do
    get edit_fact_quote_url(@fact_quote)
    assert_response :success
  end

  test "should update fact_quote" do
    patch fact_quote_url(@fact_quote), params: { fact_quote: {  } }
    assert_redirected_to fact_quote_url(@fact_quote)
  end

  test "should destroy fact_quote" do
    assert_difference('FactQuote.count', -1) do
      delete fact_quote_url(@fact_quote)
    end

    assert_redirected_to fact_quotes_url
  end
end
