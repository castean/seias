require 'test_helper'

class PriorityProgramGoalsControllerTest < ActionController::TestCase
  setup do
    @priority_program_goal = priority_program_goals(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:priority_program_goals)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create priority_program_goal" do
    assert_difference('PriorityProgramGoal.count') do
      post :create, priority_program_goal: { description: @priority_program_goal.description, hirarchy: @priority_program_goal.hirarchy, name: @priority_program_goal.name, priority_program_id: @priority_program_goal.priority_program_id }
    end

    assert_redirected_to priority_program_goal_path(assigns(:priority_program_goal))
  end

  test "should show priority_program_goal" do
    get :show, id: @priority_program_goal
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @priority_program_goal
    assert_response :success
  end

  test "should update priority_program_goal" do
    put :update, id: @priority_program_goal, priority_program_goal: { description: @priority_program_goal.description, hirarchy: @priority_program_goal.hirarchy, name: @priority_program_goal.name, priority_program_id: @priority_program_goal.priority_program_id }
    assert_redirected_to priority_program_goal_path(assigns(:priority_program_goal))
  end

  test "should destroy priority_program_goal" do
    assert_difference('PriorityProgramGoal.count', -1) do
      delete :destroy, id: @priority_program_goal
    end

    assert_redirected_to priority_program_goals_path
  end
end
