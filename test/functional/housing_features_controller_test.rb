require 'test_helper'

class HousingFeaturesControllerTest < ActionController::TestCase
  setup do
    @housing_feature = housing_features(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:housing_features)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create housing_feature" do
    assert_difference('HousingFeature.count') do
      post :create, housing_feature: { description: @housing_feature.description, point: @housing_feature.point }
    end

    assert_redirected_to housing_feature_path(assigns(:housing_feature))
  end

  test "should show housing_feature" do
    get :show, id: @housing_feature
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @housing_feature
    assert_response :success
  end

  test "should update housing_feature" do
    put :update, id: @housing_feature, housing_feature: { description: @housing_feature.description, point: @housing_feature.point }
    assert_redirected_to housing_feature_path(assigns(:housing_feature))
  end

  test "should destroy housing_feature" do
    assert_difference('HousingFeature.count', -1) do
      delete :destroy, id: @housing_feature
    end

    assert_redirected_to housing_features_path
  end
end
