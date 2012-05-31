require 'test_helper'

class StatisticalMapsControllerTest < ActionController::TestCase
  setup do
    @statistical_map = statistical_maps(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:statistical_maps)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create statistical_map" do
    assert_difference('StatisticalMap.count') do
      post :create, statistical_map: {  }
    end

    assert_redirected_to statistical_map_path(assigns(:statistical_map))
  end

  test "should show statistical_map" do
    get :show, id: @statistical_map
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @statistical_map
    assert_response :success
  end

  test "should update statistical_map" do
    put :update, id: @statistical_map, statistical_map: {  }
    assert_redirected_to statistical_map_path(assigns(:statistical_map))
  end

  test "should destroy statistical_map" do
    assert_difference('StatisticalMap.count', -1) do
      delete :destroy, id: @statistical_map
    end

    assert_redirected_to statistical_maps_path
  end
end
