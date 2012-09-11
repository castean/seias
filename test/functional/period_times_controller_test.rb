require 'test_helper'

class PeriodTimesControllerTest < ActionController::TestCase
  setup do
    @period_time = period_times(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:period_times)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create period_time" do
    assert_difference('PeriodTime.count') do
      post :create, period_time: { name: @period_time.name }
    end

    assert_redirected_to period_time_path(assigns(:period_time))
  end

  test "should show period_time" do
    get :show, id: @period_time
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @period_time
    assert_response :success
  end

  test "should update period_time" do
    put :update, id: @period_time, period_time: { name: @period_time.name }
    assert_redirected_to period_time_path(assigns(:period_time))
  end

  test "should destroy period_time" do
    assert_difference('PeriodTime.count', -1) do
      delete :destroy, id: @period_time
    end

    assert_redirected_to period_times_path
  end
end
