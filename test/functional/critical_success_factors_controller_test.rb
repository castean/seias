require 'test_helper'

class CriticalSuccessFactorsControllerTest < ActionController::TestCase
  setup do
    @critical_success_factor = critical_success_factors(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:critical_success_factors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create critical_success_factor" do
    assert_difference('CriticalSuccessFactor.count') do
      post :create, critical_success_factor: { description: @critical_success_factor.description, objective_excelent: @critical_success_factor.objective_excelent, objective_minimum: @critical_success_factor.objective_minimum, objective_satisfying: @critical_success_factor.objective_satisfying, perfectage: @critical_success_factor.perfectage, title: @critical_success_factor.title, unit_of_measurement_description: @critical_success_factor.unit_of_measurement_description }
    end

    assert_redirected_to critical_success_factor_path(assigns(:critical_success_factor))
  end

  test "should show critical_success_factor" do
    get :show, id: @critical_success_factor
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @critical_success_factor
    assert_response :success
  end

  test "should update critical_success_factor" do
    put :update, id: @critical_success_factor, critical_success_factor: { description: @critical_success_factor.description, objective_excelent: @critical_success_factor.objective_excelent, objective_minimum: @critical_success_factor.objective_minimum, objective_satisfying: @critical_success_factor.objective_satisfying, perfectage: @critical_success_factor.perfectage, title: @critical_success_factor.title, unit_of_measurement_description: @critical_success_factor.unit_of_measurement_description }
    assert_redirected_to critical_success_factor_path(assigns(:critical_success_factor))
  end

  test "should destroy critical_success_factor" do
    assert_difference('CriticalSuccessFactor.count', -1) do
      delete :destroy, id: @critical_success_factor
    end

    assert_redirected_to critical_success_factors_path
  end
end
