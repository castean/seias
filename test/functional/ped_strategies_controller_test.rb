require 'test_helper'

class PedStrategiesControllerTest < ActionController::TestCase
  setup do
    @ped_strategy = ped_strategies(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ped_strategies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ped_strategy" do
    assert_difference('PedStrategy.count') do
      post :create, ped_strategy: { description: @ped_strategy.description, hirarchy: @ped_strategy.hirarchy, name: @ped_strategy.name, ped_goal_id: @ped_strategy.ped_goal_id }
    end

    assert_redirected_to ped_strategy_path(assigns(:ped_strategy))
  end

  test "should show ped_strategy" do
    get :show, id: @ped_strategy
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ped_strategy
    assert_response :success
  end

  test "should update ped_strategy" do
    put :update, id: @ped_strategy, ped_strategy: { description: @ped_strategy.description, hirarchy: @ped_strategy.hirarchy, name: @ped_strategy.name, ped_goal_id: @ped_strategy.ped_goal_id }
    assert_redirected_to ped_strategy_path(assigns(:ped_strategy))
  end

  test "should destroy ped_strategy" do
    assert_difference('PedStrategy.count', -1) do
      delete :destroy, id: @ped_strategy
    end

    assert_redirected_to ped_strategies_path
  end
end
