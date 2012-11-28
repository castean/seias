require 'test_helper'

class PeriodTimeDeliversControllerTest < ActionController::TestCase
  setup do
    @period_time_deliver = period_time_delivers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:period_time_delivers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create period_time_deliver" do
    assert_difference('PeriodTimeDeliver.count') do
      post :create, period_time_deliver: { affiliate_id: @period_time_deliver.affiliate_id, benefit_id: @period_time_deliver.benefit_id, delivered: @period_time_deliver.delivered, period_number: @period_time_deliver.period_number, period_time_id: @period_time_deliver.period_time_id }
    end

    assert_redirected_to period_time_deliver_path(assigns(:period_time_deliver))
  end

  test "should show period_time_deliver" do
    get :show, id: @period_time_deliver
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @period_time_deliver
    assert_response :success
  end

  test "should update period_time_deliver" do
    put :update, id: @period_time_deliver, period_time_deliver: { affiliate_id: @period_time_deliver.affiliate_id, benefit_id: @period_time_deliver.benefit_id, delivered: @period_time_deliver.delivered, period_number: @period_time_deliver.period_number, period_time_id: @period_time_deliver.period_time_id }
    assert_redirected_to period_time_deliver_path(assigns(:period_time_deliver))
  end

  test "should destroy period_time_deliver" do
    assert_difference('PeriodTimeDeliver.count', -1) do
      delete :destroy, id: @period_time_deliver
    end

    assert_redirected_to period_time_delivers_path
  end
end
