require 'test_helper'

class AffiliatesControllerTest < ActionController::TestCase
  setup do
    @affiliate = affiliates(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:affiliates)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create affiliate" do
    assert_difference('Affiliate.count') do
      post :create, affiliate: { institution_id: @affiliate.institution_id, period_number: @affiliate.period_number, period_time_id: @affiliate.period_time_id, person_id: @affiliate.person_id, program_id: @affiliate.program_id, public_target_id: @affiliate.public_target_id }
    end

    assert_redirected_to affiliate_path(assigns(:affiliate))
  end

  test "should show affiliate" do
    get :show, id: @affiliate
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @affiliate
    assert_response :success
  end

  test "should update affiliate" do
    put :update, id: @affiliate, affiliate: { institution_id: @affiliate.institution_id, period_number: @affiliate.period_number, period_time_id: @affiliate.period_time_id, person_id: @affiliate.person_id, program_id: @affiliate.program_id, public_target_id: @affiliate.public_target_id }
    assert_redirected_to affiliate_path(assigns(:affiliate))
  end

  test "should destroy affiliate" do
    assert_difference('Affiliate.count', -1) do
      delete :destroy, id: @affiliate
    end

    assert_redirected_to affiliates_path
  end
end
