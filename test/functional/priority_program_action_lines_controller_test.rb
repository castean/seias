require 'test_helper'

class PriorityProgramActionLinesControllerTest < ActionController::TestCase
  setup do
    @priority_program_action_line = priority_program_action_lines(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:priority_program_action_lines)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create priority_program_action_line" do
    assert_difference('PriorityProgramActionLine.count') do
      post :create, priority_program_action_line: { description: @priority_program_action_line.description, hierarchy: @priority_program_action_line.hierarchy, name: @priority_program_action_line.name, ped_action_line_id: @priority_program_action_line.ped_action_line_id, priority_program_strategy_id: @priority_program_action_line.priority_program_strategy_id }
    end

    assert_redirected_to priority_program_action_line_path(assigns(:priority_program_action_line))
  end

  test "should show priority_program_action_line" do
    get :show, id: @priority_program_action_line
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @priority_program_action_line
    assert_response :success
  end

  test "should update priority_program_action_line" do
    put :update, id: @priority_program_action_line, priority_program_action_line: { description: @priority_program_action_line.description, hierarchy: @priority_program_action_line.hierarchy, name: @priority_program_action_line.name, ped_action_line_id: @priority_program_action_line.ped_action_line_id, priority_program_strategy_id: @priority_program_action_line.priority_program_strategy_id }
    assert_redirected_to priority_program_action_line_path(assigns(:priority_program_action_line))
  end

  test "should destroy priority_program_action_line" do
    assert_difference('PriorityProgramActionLine.count', -1) do
      delete :destroy, id: @priority_program_action_line
    end

    assert_redirected_to priority_program_action_lines_path
  end
end
