require 'test_helper'

class FunctionalSupportsControllerTest < ActionController::TestCase
  setup do
    @functionalsupport = funcional_supports(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:FunctionalSupports)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create functionalsupport" do
    assert_difference('FunctionalSupport.count') do
      post :create, functionalsupport: { name: @functionalsupport.name }
    end

    assert_redirected_to funcional_support_path(assigns(:functionalsupport))
  end

  test "should show functionalsupport" do
    get :show, id: @functionalsupport
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @functionalsupport
    assert_response :success
  end

  test "should update functionalsupport" do
    put :update, id: @functionalsupport, functionalsupport: { name: @functionalsupport.name }
    assert_redirected_to funcional_support_path(assigns(:functionalsupport))
  end

  test "should destroy functionalsupport" do
    assert_difference('FunctionalSupport.count', -1) do
      delete :destroy, id: @functionalsupport
    end

    assert_redirected_to funcional_supports_path
  end
end
