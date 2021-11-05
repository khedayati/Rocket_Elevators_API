require "application_system_test_case"

class FactElevatorsTest < ApplicationSystemTestCase
  setup do
    @fact_elevator = fact_elevators(:one)
  end

  test "visiting the index" do
    visit fact_elevators_url
    assert_selector "h1", text: "Fact Elevators"
  end

  test "creating a Fact elevator" do
    visit fact_elevators_url
    click_on "New Fact Elevator"

    click_on "Create Fact elevator"

    assert_text "Fact elevator was successfully created"
    click_on "Back"
  end

  test "updating a Fact elevator" do
    visit fact_elevators_url
    click_on "Edit", match: :first

    click_on "Update Fact elevator"

    assert_text "Fact elevator was successfully updated"
    click_on "Back"
  end

  test "destroying a Fact elevator" do
    visit fact_elevators_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Fact elevator was successfully destroyed"
  end
end
