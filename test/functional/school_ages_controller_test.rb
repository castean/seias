require 'test_helper'

class SchoolAgesControllerTest < ActionController::TestCase
  setup do
    @school_age = school_ages(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:school_ages)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create school_age" do
    assert_difference('SchoolAge.count') do
      post :create, school_age: { grade_id: @school_age.grade_id, guardianship_id: @school_age.guardianship_id, institution_id: @school_age.institution_id, real_qty_registered: @school_age.real_qty_registered, sex_id: @school_age.sex_id, total_qty_registered: @school_age.total_qty_registered }
    end

    assert_redirected_to school_age_path(assigns(:school_age))
  end

  test "should show school_age" do
    get :show, id: @school_age
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @school_age
    assert_response :success
  end

  test "should update school_age" do
    put :update, id: @school_age, school_age: { grade_id: @school_age.grade_id, guardianship_id: @school_age.guardianship_id, institution_id: @school_age.institution_id, real_qty_registered: @school_age.real_qty_registered, sex_id: @school_age.sex_id, total_qty_registered: @school_age.total_qty_registered }
    assert_redirected_to school_age_path(assigns(:school_age))
  end

  test "should destroy school_age" do
    assert_difference('SchoolAge.count', -1) do
      delete :destroy, id: @school_age
    end

    assert_redirected_to school_ages_path
  end
end
