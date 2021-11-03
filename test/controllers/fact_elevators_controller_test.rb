require 'test_helper'

class FactElevatorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @fact_elevator = fact_elevators(:one)
  end

  test "should get index" do
    get fact_elevators_url
    assert_response :success
  end

  test "should get new" do
    get new_fact_elevator_url
    assert_response :success
  end

  test "should create fact_elevator" do
    assert_difference('FactElevator.count') do
      post fact_elevators_url, params: { fact_elevator: {  } }
    end

    assert_redirected_to fact_elevator_url(FactElevator.last)
  end

  test "should show fact_elevator" do
    get fact_elevator_url(@fact_elevator)
    assert_response :success
  end

  test "should get edit" do
    get edit_fact_elevator_url(@fact_elevator)
    assert_response :success
  end

  test "should update fact_elevator" do
    patch fact_elevator_url(@fact_elevator), params: { fact_elevator: {  } }
    assert_redirected_to fact_elevator_url(@fact_elevator)
  end

  test "should destroy fact_elevator" do
    assert_difference('FactElevator.count', -1) do
      delete fact_elevator_url(@fact_elevator)
    end

    assert_redirected_to fact_elevators_url
  end
end
