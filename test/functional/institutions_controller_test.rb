require 'test_helper'

class InstitutionsControllerTest < ActionController::TestCase
  setup do
    @institution = institutions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:institutions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create institution" do
    assert_difference('Institution.count') do
      post :create, institution: { address: @institution.address, busines_line_id: @institution.busines_line_id, country_id: @institution.country_id, date_operation_end: @institution.date_operation_end, date_operation_start: @institution.date_operation_start, email: @institution.email, external_address_number: @institution.external_address_number, father_institution_id: @institution.father_institution_id, gmaps: @institution.gmaps, institution_type_id: @institution.institution_type_id, internal_address_number: @institution.internal_address_number, latitude: @institution.latitude, legal_last_name: @institution.legal_last_name, legal_name: @institution.legal_name, legal_second_last_name: @institution.legal_second_last_name, link_user_id: @institution.link_user_id, longitude: @institution.longitude, name: @institution.name, phone: @institution.phone, religion_id: @institution.religion_id, rfc: @institution.rfc, second_address: @institution.second_address, status_id: @institution.status_id, town_id: @institution.town_id, type_person: @institution.type_person, zip_code: @institution.zip_code }
    end

    assert_redirected_to institution_path(assigns(:institution))
  end

  test "should show institution" do
    get :show, id: @institution
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @institution
    assert_response :success
  end

  test "should update institution" do
    put :update, id: @institution, institution: { address: @institution.address, busines_line_id: @institution.busines_line_id, country_id: @institution.country_id, date_operation_end: @institution.date_operation_end, date_operation_start: @institution.date_operation_start, email: @institution.email, external_address_number: @institution.external_address_number, father_institution_id: @institution.father_institution_id, gmaps: @institution.gmaps, institution_type_id: @institution.institution_type_id, internal_address_number: @institution.internal_address_number, latitude: @institution.latitude, legal_last_name: @institution.legal_last_name, legal_name: @institution.legal_name, legal_second_last_name: @institution.legal_second_last_name, link_user_id: @institution.link_user_id, longitude: @institution.longitude, name: @institution.name, phone: @institution.phone, religion_id: @institution.religion_id, rfc: @institution.rfc, second_address: @institution.second_address, status_id: @institution.status_id, town_id: @institution.town_id, type_person: @institution.type_person, zip_code: @institution.zip_code }
    assert_redirected_to institution_path(assigns(:institution))
  end

  test "should destroy institution" do
    assert_difference('Institution.count', -1) do
      delete :destroy, id: @institution
    end

    assert_redirected_to institutions_path
  end
end
