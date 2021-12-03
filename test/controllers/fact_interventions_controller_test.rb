require 'test_helper'

class FactInterventionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @fact_intervention = fact_interventions(:one)
  end

  test "should get index" do
    get fact_interventions_url
    assert_response :success
  end

  test "should get new" do
    get new_fact_intervention_url
    assert_response :success
  end

  test "should create fact_intervention" do
    assert_difference('FactIntervention.count') do
      post fact_interventions_url, params: { fact_intervention: { author: @fact_intervention.author, battery_id: @fact_intervention.battery_id, building_id: @fact_intervention.building_id, column_id: @fact_intervention.column_id, customer_id: @fact_intervention.customer_id, elevator_id: @fact_intervention.elevator_id, employee_id: @fact_intervention.employee_id, intervention_end: @fact_intervention.intervention_end, intervention_start: @fact_intervention.intervention_start, report: @fact_intervention.report, result: @fact_intervention.result, status: @fact_intervention.status } }
    end

    assert_redirected_to fact_intervention_url(FactIntervention.last)
  end

  test "should show fact_intervention" do
    get fact_intervention_url(@fact_intervention)
    assert_response :success
  end

  test "should get edit" do
    get edit_fact_intervention_url(@fact_intervention)
    assert_response :success
  end

  test "should update fact_intervention" do
    patch fact_intervention_url(@fact_intervention), params: { fact_intervention: { author: @fact_intervention.author, battery_id: @fact_intervention.battery_id, building_id: @fact_intervention.building_id, column_id: @fact_intervention.column_id, customer_id: @fact_intervention.customer_id, elevator_id: @fact_intervention.elevator_id, employee_id: @fact_intervention.employee_id, intervention_end: @fact_intervention.intervention_end, intervention_start: @fact_intervention.intervention_start, report: @fact_intervention.report, result: @fact_intervention.result, status: @fact_intervention.status } }
    assert_redirected_to fact_intervention_url(@fact_intervention)
  end

  test "should destroy fact_intervention" do
    assert_difference('FactIntervention.count', -1) do
      delete fact_intervention_url(@fact_intervention)
    end

    assert_redirected_to fact_interventions_url
  end
end
