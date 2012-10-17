require 'test_helper'

class FuncionalSupportsControllerTest < ActionController::TestCase
  setup do
    @funcional_support = funcional_supports(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:funcional_supports)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create funcional_support" do
    assert_difference('FuncionalSupport.count') do
      post :create, funcional_support: { name: @funcional_support.name }
    end

    assert_redirected_to funcional_support_path(assigns(:funcional_support))
  end

  test "should show funcional_support" do
    get :show, id: @funcional_support
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @funcional_support
    assert_response :success
  end

  test "should update funcional_support" do
    put :update, id: @funcional_support, funcional_support: { name: @funcional_support.name }
    assert_redirected_to funcional_support_path(assigns(:funcional_support))
  end

  test "should destroy funcional_support" do
    assert_difference('FuncionalSupport.count', -1) do
      delete :destroy, id: @funcional_support
    end

    assert_redirected_to funcional_supports_path
  end
end
