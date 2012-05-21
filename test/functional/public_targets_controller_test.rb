require 'test_helper'

class PublicTargetsControllerTest < ActionController::TestCase
  setup do
    @public_target = public_targets(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:public_targets)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create public_target" do
    assert_difference('PublicTarget.count') do
      post :create, public_target: { description: @public_target.description, name: @public_target.name }
    end

    assert_redirected_to public_target_path(assigns(:public_target))
  end

  test "should show public_target" do
    get :show, id: @public_target
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @public_target
    assert_response :success
  end

  test "should update public_target" do
    put :update, id: @public_target, public_target: { description: @public_target.description, name: @public_target.name }
    assert_redirected_to public_target_path(assigns(:public_target))
  end

  test "should destroy public_target" do
    assert_difference('PublicTarget.count', -1) do
      delete :destroy, id: @public_target
    end

    assert_redirected_to public_targets_path
  end
end
