require 'test_helper'

class WorthsControllerTest < ActionController::TestCase
  setup do
    @worth = worths(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:worths)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create worth" do
    assert_difference('Worth.count') do
      post :create, worth: { direction_id: @worth.direction_id, name: @worth.name }
    end

    assert_redirected_to worth_path(assigns(:worth))
  end

  test "should show worth" do
    get :show, id: @worth
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @worth
    assert_response :success
  end

  test "should update worth" do
    put :update, id: @worth, worth: { direction_id: @worth.direction_id, name: @worth.name }
    assert_redirected_to worth_path(assigns(:worth))
  end

  test "should destroy worth" do
    assert_difference('Worth.count', -1) do
      delete :destroy, id: @worth
    end

    assert_redirected_to worths_path
  end
end
