require 'test_helper'

class PedThemesControllerTest < ActionController::TestCase
  setup do
    @ped_theme = ped_themes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ped_themes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ped_theme" do
    assert_difference('PedTheme.count') do
      post :create, ped_theme: { description: @ped_theme.description, name: @ped_theme.name, ped_axis_development_id: @ped_theme.ped_axis_development_id }
    end

    assert_redirected_to ped_theme_path(assigns(:ped_theme))
  end

  test "should show ped_theme" do
    get :show, id: @ped_theme
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ped_theme
    assert_response :success
  end

  test "should update ped_theme" do
    put :update, id: @ped_theme, ped_theme: { description: @ped_theme.description, name: @ped_theme.name, ped_axis_development_id: @ped_theme.ped_axis_development_id }
    assert_redirected_to ped_theme_path(assigns(:ped_theme))
  end

  test "should destroy ped_theme" do
    assert_difference('PedTheme.count', -1) do
      delete :destroy, id: @ped_theme
    end

    assert_redirected_to ped_themes_path
  end
end
