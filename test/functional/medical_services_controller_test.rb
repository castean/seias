require 'test_helper'

class MedicalServicesControllerTest < ActionController::TestCase
  setup do
    @medical_service = medical_services(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:medical_services)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create medical_service" do
    assert_difference('MedicalService.count') do
      post :create, medical_service: { name: @medical_service.name }
    end

    assert_redirected_to medical_service_path(assigns(:medical_service))
  end

  test "should show medical_service" do
    get :show, id: @medical_service
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @medical_service
    assert_response :success
  end

  test "should update medical_service" do
    put :update, id: @medical_service, medical_service: { name: @medical_service.name }
    assert_redirected_to medical_service_path(assigns(:medical_service))
  end

  test "should destroy medical_service" do
    assert_difference('MedicalService.count', -1) do
      delete :destroy, id: @medical_service
    end

    assert_redirected_to medical_services_path
  end
end
