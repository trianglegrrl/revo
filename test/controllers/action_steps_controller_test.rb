require 'test_helper'

class ActionStepsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @action_step = action_steps(:one)
  end

  test "should get index" do
    get action_steps_url
    assert_response :success
  end

  test "should get new" do
    get new_action_step_url
    assert_response :success
  end

  test "should create action_step" do
    assert_difference('ActionStep.count') do
      post action_steps_url, params: { action_step: { description: @action_step.description, name: @action_step.name } }
    end

    assert_redirected_to action_step_url(ActionStep.last)
  end

  test "should show action_step" do
    get action_step_url(@action_step)
    assert_response :success
  end

  test "should get edit" do
    get edit_action_step_url(@action_step)
    assert_response :success
  end

  test "should update action_step" do
    patch action_step_url(@action_step), params: { action_step: { description: @action_step.description, name: @action_step.name } }
    assert_redirected_to action_step_url(@action_step)
  end

  test "should destroy action_step" do
    assert_difference('ActionStep.count', -1) do
      delete action_step_url(@action_step)
    end

    assert_redirected_to action_steps_url
  end
end
