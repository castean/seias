require 'test_helper'

class BenefitCategoriesControllerTest < ActionController::TestCase
  setup do
    @benefit_category = benefit_categories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:benefit_categories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create benefit_category" do
    assert_difference('BenefitCategory.count') do
      post :create, benefit_category: { name: @benefit_category.name }
    end

    assert_redirected_to benefit_category_path(assigns(:benefit_category))
  end

  test "should show benefit_category" do
    get :show, id: @benefit_category
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @benefit_category
    assert_response :success
  end

  test "should update benefit_category" do
    put :update, id: @benefit_category, benefit_category: { name: @benefit_category.name }
    assert_redirected_to benefit_category_path(assigns(:benefit_category))
  end

  test "should destroy benefit_category" do
    assert_difference('BenefitCategory.count', -1) do
      delete :destroy, id: @benefit_category
    end

    assert_redirected_to benefit_categories_path
  end
end
