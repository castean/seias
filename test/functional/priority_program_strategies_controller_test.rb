require 'test_helper'

class PriorityProgramStrategiesControllerTest < ActionController::TestCase
  setup do
    @priority_program_strategy = priority_program_strategies(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:priority_program_strategies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create priority_program_strategy" do
    assert_difference('PriorityProgramStrategy.count') do
      post :create, priority_program_strategy: { description: @priority_program_strategy.description, hierarchy: @priority_program_strategy.hierarchy, name: @priority_program_strategy.name, priority_program_goal_id: @priority_program_strategy.priority_program_goal_id }
    end

    assert_redirected_to priority_program_strategy_path(assigns(:priority_program_strategy))
  end

  test "should show priority_program_strategy" do
    get :show, id: @priority_program_strategy
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @priority_program_strategy
    assert_response :success
  end

  test "should update priority_program_strategy" do
    put :update, id: @priority_program_strategy, priority_program_strategy: { description: @priority_program_strategy.description, hierarchy: @priority_program_strategy.hierarchy, name: @priority_program_strategy.name, priority_program_goal_id: @priority_program_strategy.priority_program_goal_id }
    assert_redirected_to priority_program_strategy_path(assigns(:priority_program_strategy))
  end

  test "should destroy priority_program_strategy" do
    assert_difference('PriorityProgramStrategy.count', -1) do
      delete :destroy, id: @priority_program_strategy
    end

    assert_redirected_to priority_program_strategies_path
  end
end
