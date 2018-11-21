require "application_system_test_case"

class UserActionStepsTest < ApplicationSystemTestCase
  setup do
    @user_action_step = user_action_steps(:one)
  end

  test "visiting the index" do
    visit user_action_steps_url
    assert_selector "h1", text: "User Action Steps"
  end

  test "creating a User action step" do
    visit user_action_steps_url
    click_on "New User Action Step"

    fill_in "Action Step", with: @user_action_step.action_step_id
    fill_in "Active Date", with: @user_action_step.active_date
    fill_in "Expiration Date", with: @user_action_step.expiration_date
    fill_in "Status", with: @user_action_step.status
    fill_in "User", with: @user_action_step.user_id
    click_on "Create User action step"

    assert_text "User action step was successfully created"
    click_on "Back"
  end

  test "updating a User action step" do
    visit user_action_steps_url
    click_on "Edit", match: :first

    fill_in "Action Step", with: @user_action_step.action_step_id
    fill_in "Active Date", with: @user_action_step.active_date
    fill_in "Expiration Date", with: @user_action_step.expiration_date
    fill_in "Status", with: @user_action_step.status
    fill_in "User", with: @user_action_step.user_id
    click_on "Update User action step"

    assert_text "User action step was successfully updated"
    click_on "Back"
  end

  test "destroying a User action step" do
    visit user_action_steps_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "User action step was successfully destroyed"
  end
end
