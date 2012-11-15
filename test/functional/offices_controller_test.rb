require 'test_helper'

class OfficesControllerTest < ActionController::TestCase
  setup do
    @office = offices(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:offices)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create office" do
    assert_difference('Office.count') do
      post :create, office: { activity_type_id: @office.activity_type_id, avatar: @office.avatar, department_id: @office.department_id, external_office_number: @office.external_office_number, internal_office_number: @office.internal_office_number, name: @office.name, observations: @office.observations, office_date: @office.office_date, office_recive_date: @office.office_recive_date, person_id: @office.person_id, priority_id: @office.priority_id, record_no: @office.record_no, status_id: @office.status_id, to: @office.to, type_id: @office.type_id, user_id: @office.user_id }
    end

    assert_redirected_to office_path(assigns(:office))
  end

  test "should show office" do
    get :show, id: @office
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @office
    assert_response :success
  end

  test "should update office" do
    put :update, id: @office, office: { activity_type_id: @office.activity_type_id, avatar: @office.avatar, department_id: @office.department_id, external_office_number: @office.external_office_number, internal_office_number: @office.internal_office_number, name: @office.name, observations: @office.observations, office_date: @office.office_date, office_recive_date: @office.office_recive_date, person_id: @office.person_id, priority_id: @office.priority_id, record_no: @office.record_no, status_id: @office.status_id, to: @office.to, type_id: @office.type_id, user_id: @office.user_id }
    assert_redirected_to office_path(assigns(:office))
  end

  test "should destroy office" do
    assert_difference('Office.count', -1) do
      delete :destroy, id: @office
    end

    assert_redirected_to offices_path
  end
end
