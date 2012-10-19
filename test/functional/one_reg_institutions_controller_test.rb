require 'test_helper'

class OneRegInstitutionsControllerTest < ActionController::TestCase
  setup do
    @one_reg_institution = one_reg_institutions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:one_reg_institutions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create one_reg_institution" do
    assert_difference('OneRegInstitution.count') do
      post :create, one_reg_institution: { according_social_purpose: @one_reg_institution.according_social_purpose, capacity: @one_reg_institution.capacity, institution_id: @one_reg_institution.institution_id, max_age: @one_reg_institution.max_age, min_age: @one_reg_institution.min_age, operation_status: @one_reg_institution.operation_status, people_sex: @one_reg_institution.people_sex, public_target_id: @one_reg_institution.public_target_id }
    end

    assert_redirected_to one_reg_institution_path(assigns(:one_reg_institution))
  end

  test "should show one_reg_institution" do
    get :show, id: @one_reg_institution
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @one_reg_institution
    assert_response :success
  end

  test "should update one_reg_institution" do
    put :update, id: @one_reg_institution, one_reg_institution: { according_social_purpose: @one_reg_institution.according_social_purpose, capacity: @one_reg_institution.capacity, institution_id: @one_reg_institution.institution_id, max_age: @one_reg_institution.max_age, min_age: @one_reg_institution.min_age, operation_status: @one_reg_institution.operation_status, people_sex: @one_reg_institution.people_sex, public_target_id: @one_reg_institution.public_target_id }
    assert_redirected_to one_reg_institution_path(assigns(:one_reg_institution))
  end

  test "should destroy one_reg_institution" do
    assert_difference('OneRegInstitution.count', -1) do
      delete :destroy, id: @one_reg_institution
    end

    assert_redirected_to one_reg_institutions_path
  end
end
