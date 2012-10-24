require 'test_helper'

class DiscapacityOriginsControllerTest < ActionController::TestCase
  setup do
    @discapacity_origin = discapacity_origins(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:discapacity_origins)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create discapacity_origin" do
    assert_difference('DiscapacityOrigin.count') do
      post :create, discapacity_origin: { name: @discapacity_origin.name }
    end

    assert_redirected_to discapacity_origin_path(assigns(:discapacity_origin))
  end

  test "should show discapacity_origin" do
    get :show, id: @discapacity_origin
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @discapacity_origin
    assert_response :success
  end

  test "should update discapacity_origin" do
    put :update, id: @discapacity_origin, discapacity_origin: { name: @discapacity_origin.name }
    assert_redirected_to discapacity_origin_path(assigns(:discapacity_origin))
  end

  test "should destroy discapacity_origin" do
    assert_difference('DiscapacityOrigin.count', -1) do
      delete :destroy, id: @discapacity_origin
    end

    assert_redirected_to discapacity_origins_path
  end
end
