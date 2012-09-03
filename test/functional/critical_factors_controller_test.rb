require 'test_helper'

class CriticalFactorsControllerTest < ActionController::TestCase
  setup do
    @critical_factor = critical_factors(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:critical_factors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create critical_factor" do
    assert_difference('CriticalFactor.count') do
      post :create, critical_factor: { critical_succes_factor_type_id: @critical_factor.critical_succes_factor_type_id, description: @critical_factor.description, name: @critical_factor.name }
    end

    assert_redirected_to critical_factor_path(assigns(:critical_factor))
  end

  test "should show critical_factor" do
    get :show, id: @critical_factor
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @critical_factor
    assert_response :success
  end

  test "should update critical_factor" do
    put :update, id: @critical_factor, critical_factor: { critical_succes_factor_type_id: @critical_factor.critical_succes_factor_type_id, description: @critical_factor.description, name: @critical_factor.name }
    assert_redirected_to critical_factor_path(assigns(:critical_factor))
  end

  test "should destroy critical_factor" do
    assert_difference('CriticalFactor.count', -1) do
      delete :destroy, id: @critical_factor
    end

    assert_redirected_to critical_factors_path
  end
end
