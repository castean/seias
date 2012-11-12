require 'test_helper'

class OfficeRecordsControllerTest < ActionController::TestCase
  setup do
    @office_record = office_records(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:office_records)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create office_record" do
    assert_difference('OfficeRecord.count') do
      post :create, office_record: { info: @office_record.info, office_id: @office_record.office_id, user_id: @office_record.user_id }
    end

    assert_redirected_to office_record_path(assigns(:office_record))
  end

  test "should show office_record" do
    get :show, id: @office_record
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @office_record
    assert_response :success
  end

  test "should update office_record" do
    put :update, id: @office_record, office_record: { info: @office_record.info, office_id: @office_record.office_id, user_id: @office_record.user_id }
    assert_redirected_to office_record_path(assigns(:office_record))
  end

  test "should destroy office_record" do
    assert_difference('OfficeRecord.count', -1) do
      delete :destroy, id: @office_record
    end

    assert_redirected_to office_records_path
  end
end
