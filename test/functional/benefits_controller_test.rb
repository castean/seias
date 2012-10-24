require 'test_helper'

class BenefitsControllerTest < ActionController::TestCase
  setup do
    @benefit = benefits(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:benefits)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create benefit" do
    assert_difference('Benefit.count') do
      post :create, benefit: { affiliate_id: @benefit.affiliate_id, benefit_category_id: @benefit.benefit_category_id, delivery_date: @benefit.delivery_date, period: @benefit.period, qty: @benefit.qty, unit_price: @benefit.unit_price, worth: @benefit.worth }
    end

    assert_redirected_to benefit_path(assigns(:benefit))
  end

  test "should show benefit" do
    get :show, id: @benefit
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @benefit
    assert_response :success
  end

  test "should update benefit" do
    put :update, id: @benefit, benefit: { affiliate_id: @benefit.affiliate_id, benefit_category_id: @benefit.benefit_category_id, delivery_date: @benefit.delivery_date, period: @benefit.period, qty: @benefit.qty, unit_price: @benefit.unit_price, worth: @benefit.worth }
    assert_redirected_to benefit_path(assigns(:benefit))
  end

  test "should destroy benefit" do
    assert_difference('Benefit.count', -1) do
      delete :destroy, id: @benefit
    end

    assert_redirected_to benefits_path
  end
end
