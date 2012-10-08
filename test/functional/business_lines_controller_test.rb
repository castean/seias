require 'test_helper'

class BusinessLinesControllerTest < ActionController::TestCase
  setup do
    @business_line = business_lines(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:business_lines)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create business_line" do
    assert_difference('BusinessLine.count') do
      post :create, business_line: { name: @business_line.name }
    end

    assert_redirected_to business_line_path(assigns(:business_line))
  end

  test "should show business_line" do
    get :show, id: @business_line
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @business_line
    assert_response :success
  end

  test "should update business_line" do
    put :update, id: @business_line, business_line: { name: @business_line.name }
    assert_redirected_to business_line_path(assigns(:business_line))
  end

  test "should destroy business_line" do
    assert_difference('BusinessLine.count', -1) do
      delete :destroy, id: @business_line
    end

    assert_redirected_to business_lines_path
  end
end
