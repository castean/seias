require 'test_helper'

class CriticalSuccessFactorTypesControllerTest < ActionController::TestCase
  setup do
    @critical_success_factor_type = critical_success_factor_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:critical_success_factor_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create critical_success_factor_type" do
    assert_difference('CriticalSuccessFactorType.count') do
      post :create, critical_success_factor_type: { name: @critical_success_factor_type.name }
    end

    assert_redirected_to critical_success_factor_type_path(assigns(:critical_success_factor_type))
  end

  test "should show critical_success_factor_type" do
    get :show, id: @critical_success_factor_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @critical_success_factor_type
    assert_response :success
  end

  test "should update critical_success_factor_type" do
    put :update, id: @critical_success_factor_type, critical_success_factor_type: { name: @critical_success_factor_type.name }
    assert_redirected_to critical_success_factor_type_path(assigns(:critical_success_factor_type))
  end

  test "should destroy critical_success_factor_type" do
    assert_difference('CriticalSuccessFactorType.count', -1) do
      delete :destroy, id: @critical_success_factor_type
    end

    assert_redirected_to critical_success_factor_types_path
  end
end
