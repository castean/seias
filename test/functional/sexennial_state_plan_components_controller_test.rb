require 'test_helper'

class SexennialStatePlanComponentsControllerTest < ActionController::TestCase
  setup do
    @sexennial_state_plan_component = sexennial_state_plan_components(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sexennial_state_plan_components)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sexennial_state_plan_component" do
    assert_difference('SexennialStatePlanComponent.count') do
      post :create, sexennial_state_plan_component: { description: @sexennial_state_plan_component.description, title: @sexennial_state_plan_component.title }
    end

    assert_redirected_to sexennial_state_plan_component_path(assigns(:sexennial_state_plan_component))
  end

  test "should show sexennial_state_plan_component" do
    get :show, id: @sexennial_state_plan_component
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @sexennial_state_plan_component
    assert_response :success
  end

  test "should update sexennial_state_plan_component" do
    put :update, id: @sexennial_state_plan_component, sexennial_state_plan_component: { description: @sexennial_state_plan_component.description, title: @sexennial_state_plan_component.title }
    assert_redirected_to sexennial_state_plan_component_path(assigns(:sexennial_state_plan_component))
  end

  test "should destroy sexennial_state_plan_component" do
    assert_difference('SexennialStatePlanComponent.count', -1) do
      delete :destroy, id: @sexennial_state_plan_component
    end

    assert_redirected_to sexennial_state_plan_components_path
  end
end
