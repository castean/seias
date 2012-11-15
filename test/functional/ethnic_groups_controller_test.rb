require 'test_helper'

class EthnicGroupsControllerTest < ActionController::TestCase
  setup do
    @ethnic_group = ethnic_groups(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ethnic_groups)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ethnic_group" do
    assert_difference('EthnicGroup.count') do
      post :create, ethnic_group: { name: @ethnic_group.name }
    end

    assert_redirected_to ethnic_group_path(assigns(:ethnic_group))
  end

  test "should show ethnic_group" do
    get :show, id: @ethnic_group
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ethnic_group
    assert_response :success
  end

  test "should update ethnic_group" do
    put :update, id: @ethnic_group, ethnic_group: { name: @ethnic_group.name }
    assert_redirected_to ethnic_group_path(assigns(:ethnic_group))
  end

  test "should destroy ethnic_group" do
    assert_difference('EthnicGroup.count', -1) do
      delete :destroy, id: @ethnic_group
    end

    assert_redirected_to ethnic_groups_path
  end
end
