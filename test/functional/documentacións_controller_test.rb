require 'test_helper'

class DocumentaciónsControllerTest < ActionController::TestCase
  setup do
    @documentación = documentacións(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:documentacións)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create documentación" do
    assert_difference('Documentación.count') do
      post :create, documentación: { name: @documentación.name, requerida: @documentación.requerida }
    end

    assert_redirected_to documentación_path(assigns(:documentación))
  end

  test "should show documentación" do
    get :show, id: @documentación
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @documentación
    assert_response :success
  end

  test "should update documentación" do
    put :update, id: @documentación, documentación: { name: @documentación.name, requerida: @documentación.requerida }
    assert_redirected_to documentación_path(assigns(:documentación))
  end

  test "should destroy documentación" do
    assert_difference('Documentación.count', -1) do
      delete :destroy, id: @documentación
    end

    assert_redirected_to documentacións_path
  end
end
