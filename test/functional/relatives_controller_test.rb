require 'test_helper'

class RelativesControllerTest < ActionController::TestCase
  setup do
    @relative = relatives(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:relatives)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create relative" do
    assert_difference('Relative.count') do
      post :create, relative: { person_id: @relative.person_id, relationship_id: @relative.relationship_id, relative_id: @relative.relative_id }
    end

    assert_redirected_to relative_path(assigns(:relative))
  end

  test "should show relative" do
    get :show, id: @relative
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @relative
    assert_response :success
  end

  test "should update relative" do
    put :update, id: @relative, relative: { person_id: @relative.person_id, relationship_id: @relative.relationship_id, relative_id: @relative.relative_id }
    assert_redirected_to relative_path(assigns(:relative))
  end

  test "should destroy relative" do
    assert_difference('Relative.count', -1) do
      delete :destroy, id: @relative
    end

    assert_redirected_to relatives_path
  end
end
