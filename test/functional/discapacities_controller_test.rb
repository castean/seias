require 'test_helper'

class DiscapacitiesControllerTest < ActionController::TestCase
  setup do
    @discapacity = discapacities(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:discapacities)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create discapacity" do
    assert_difference('Discapacity.count') do
      post :create, discapacity: { name: @discapacity.name }
    end

    assert_redirected_to discapacity_path(assigns(:discapacity))
  end

  test "should show discapacity" do
    get :show, id: @discapacity
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @discapacity
    assert_response :success
  end

  test "should update discapacity" do
    put :update, id: @discapacity, discapacity: { name: @discapacity.name }
    assert_redirected_to discapacity_path(assigns(:discapacity))
  end

  test "should destroy discapacity" do
    assert_difference('Discapacity.count', -1) do
      delete :destroy, id: @discapacity
    end

    assert_redirected_to discapacities_path
  end
end
