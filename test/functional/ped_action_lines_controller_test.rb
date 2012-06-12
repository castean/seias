require 'test_helper'

class PedActionLinesControllerTest < ActionController::TestCase
  setup do
    @ped_action_line = ped_action_lines(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ped_action_lines)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ped_action_line" do
    assert_difference('PedActionLine.count') do
      post :create, ped_action_line: { description: @ped_action_line.description, hirarchy: @ped_action_line.hirarchy, name: @ped_action_line.name, ped_strategy_id: @ped_action_line.ped_strategy_id }
    end

    assert_redirected_to ped_action_line_path(assigns(:ped_action_line))
  end

  test "should show ped_action_line" do
    get :show, id: @ped_action_line
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ped_action_line
    assert_response :success
  end

  test "should update ped_action_line" do
    put :update, id: @ped_action_line, ped_action_line: { description: @ped_action_line.description, hirarchy: @ped_action_line.hirarchy, name: @ped_action_line.name, ped_strategy_id: @ped_action_line.ped_strategy_id }
    assert_redirected_to ped_action_line_path(assigns(:ped_action_line))
  end

  test "should destroy ped_action_line" do
    assert_difference('PedActionLine.count', -1) do
      delete :destroy, id: @ped_action_line
    end

    assert_redirected_to ped_action_lines_path
  end
end
