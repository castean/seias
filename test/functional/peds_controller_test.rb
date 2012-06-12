require 'test_helper'

class PedsControllerTest < ActionController::TestCase
  setup do
    @ped = peds(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:peds)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ped" do
    assert_difference('Ped.count') do
      post :create, ped: { date_end: @ped.date_end, date_start: @ped.date_start, description: @ped.description, name: @ped.name }
    end

    assert_redirected_to ped_path(assigns(:ped))
  end

  test "should show ped" do
    get :show, id: @ped
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ped
    assert_response :success
  end

  test "should update ped" do
    put :update, id: @ped, ped: { date_end: @ped.date_end, date_start: @ped.date_start, description: @ped.description, name: @ped.name }
    assert_redirected_to ped_path(assigns(:ped))
  end

  test "should destroy ped" do
    assert_difference('Ped.count', -1) do
      delete :destroy, id: @ped
    end

    assert_redirected_to peds_path
  end
end
