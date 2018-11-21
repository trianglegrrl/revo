require 'test_helper'

class UserActionStepsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user_action_step = user_action_steps(:one)
  end

  test "should get index" do
    get user_action_steps_url
    assert_response :success
  end

  test "should get new" do
    get new_user_action_step_url
    assert_response :success
  end

  test "should create user_action_step" do
    assert_difference('UserActionStep.count') do
      post user_action_steps_url, params: { user_action_step: { action_step_id: @user_action_step.action_step_id, active_date: @user_action_step.active_date, expiration_date: @user_action_step.expiration_date, status: @user_action_step.status, user_id: @user_action_step.user_id } }
    end

    assert_redirected_to user_action_step_url(UserActionStep.last)
  end

  test "should show user_action_step" do
    get user_action_step_url(@user_action_step)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_action_step_url(@user_action_step)
    assert_response :success
  end

  test "should update user_action_step" do
    patch user_action_step_url(@user_action_step), params: { user_action_step: { action_step_id: @user_action_step.action_step_id, active_date: @user_action_step.active_date, expiration_date: @user_action_step.expiration_date, status: @user_action_step.status, user_id: @user_action_step.user_id } }
    assert_redirected_to user_action_step_url(@user_action_step)
  end

  test "should destroy user_action_step" do
    assert_difference('UserActionStep.count', -1) do
      delete user_action_step_url(@user_action_step)
    end

    assert_redirected_to user_action_steps_url
  end
end
