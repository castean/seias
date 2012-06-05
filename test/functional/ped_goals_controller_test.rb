require 'test_helper'

class PedGoalsControllerTest < ActionController::TestCase
  setup do
    @ped_goal = ped_goals(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ped_goals)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ped_goal" do
    assert_difference('PedGoal.count') do
      post :create, ped_goal: { description: @ped_goal.description, hirarchy: @ped_goal.hirarchy, name: @ped_goal.name, ped_id: @ped_goal.ped_id }
    end

    assert_redirected_to ped_goal_path(assigns(:ped_goal))
  end

  test "should show ped_goal" do
    get :show, id: @ped_goal
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ped_goal
    assert_response :success
  end

  test "should update ped_goal" do
    put :update, id: @ped_goal, ped_goal: { description: @ped_goal.description, hirarchy: @ped_goal.hirarchy, name: @ped_goal.name, ped_id: @ped_goal.ped_id }
    assert_redirected_to ped_goal_path(assigns(:ped_goal))
  end

  test "should destroy ped_goal" do
    assert_difference('PedGoal.count', -1) do
      delete :destroy, id: @ped_goal
    end

    assert_redirected_to ped_goals_path
  end
end
