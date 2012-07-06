require 'test_helper'

class PedAxisDevelopmentsControllerTest < ActionController::TestCase
  setup do
    @ped_axis_development = ped_axis_developments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ped_axis_developments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ped_axis_development" do
    assert_difference('PedAxisDevelopment.count') do
      post :create, ped_axis_development: { description: @ped_axis_development.description, name: @ped_axis_development.name, ped_program_definition_id: @ped_axis_development.ped_program_definition_id }
    end

    assert_redirected_to ped_axis_development_path(assigns(:ped_axis_development))
  end

  test "should show ped_axis_development" do
    get :show, id: @ped_axis_development
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ped_axis_development
    assert_response :success
  end

  test "should update ped_axis_development" do
    put :update, id: @ped_axis_development, ped_axis_development: { description: @ped_axis_development.description, name: @ped_axis_development.name, ped_program_definition_id: @ped_axis_development.ped_program_definition_id }
    assert_redirected_to ped_axis_development_path(assigns(:ped_axis_development))
  end

  test "should destroy ped_axis_development" do
    assert_difference('PedAxisDevelopment.count', -1) do
      delete :destroy, id: @ped_axis_development
    end

    assert_redirected_to ped_axis_developments_path
  end
end
