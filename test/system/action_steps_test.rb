require "application_system_test_case"

class ActionStepsTest < ApplicationSystemTestCase
  setup do
    @action_step = action_steps(:one)
  end

  test "visiting the index" do
    visit action_steps_url
    assert_selector "h1", text: "Action Steps"
  end

  test "creating a Action step" do
    visit action_steps_url
    click_on "New Action Step"

    fill_in "Description", with: @action_step.description
    fill_in "Name", with: @action_step.name
    click_on "Create Action step"

    assert_text "Action step was successfully created"
    click_on "Back"
  end

  test "updating a Action step" do
    visit action_steps_url
    click_on "Edit", match: :first

    fill_in "Description", with: @action_step.description
    fill_in "Name", with: @action_step.name
    click_on "Update Action step"

    assert_text "Action step was successfully updated"
    click_on "Back"
  end

  test "destroying a Action step" do
    visit action_steps_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Action step was successfully destroyed"
  end
end
