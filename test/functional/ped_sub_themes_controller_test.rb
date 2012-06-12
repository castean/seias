require 'test_helper'

class PedSubThemesControllerTest < ActionController::TestCase
  setup do
    @ped_sub_theme = ped_sub_themes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ped_sub_themes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ped_sub_theme" do
    assert_difference('PedSubTheme.count') do
      post :create, ped_sub_theme: { description: @ped_sub_theme.description, name: @ped_sub_theme.name }
    end

    assert_redirected_to ped_sub_theme_path(assigns(:ped_sub_theme))
  end

  test "should show ped_sub_theme" do
    get :show, id: @ped_sub_theme
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ped_sub_theme
    assert_response :success
  end

  test "should update ped_sub_theme" do
    put :update, id: @ped_sub_theme, ped_sub_theme: { description: @ped_sub_theme.description, name: @ped_sub_theme.name }
    assert_redirected_to ped_sub_theme_path(assigns(:ped_sub_theme))
  end

  test "should destroy ped_sub_theme" do
    assert_difference('PedSubTheme.count', -1) do
      delete :destroy, id: @ped_sub_theme
    end

    assert_redirected_to ped_sub_themes_path
  end
end
