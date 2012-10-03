require 'test_helper'

class InstitutionsTypesControllerTest < ActionController::TestCase
  setup do
    @institutions_type = institutions_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:institutions_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create institutions_type" do
    assert_difference('InstitutionsType.count') do
      post :create, institutions_type: { name: @institutions_type.name }
    end

    assert_redirected_to institutions_type_path(assigns(:institutions_type))
  end

  test "should show institutions_type" do
    get :show, id: @institutions_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @institutions_type
    assert_response :success
  end

  test "should update institutions_type" do
    put :update, id: @institutions_type, institutions_type: { name: @institutions_type.name }
    assert_redirected_to institutions_type_path(assigns(:institutions_type))
  end

  test "should destroy institutions_type" do
    assert_difference('InstitutionsType.count', -1) do
      delete :destroy, id: @institutions_type
    end

    assert_redirected_to institutions_types_path
  end
end
