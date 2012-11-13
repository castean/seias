require 'test_helper'

class OfficeAllocationsControllerTest < ActionController::TestCase
  setup do
    @office_allocation = office_allocations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:office_allocations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create office_allocation" do
    assert_difference('OfficeAllocation.count') do
      post :create, office_allocation: { infot: @office_allocation.infot, location_status: @office_allocation.location_status, move_by_user_id: @office_allocation.move_by_user_id, office_id: @office_allocation.office_id, place: @office_allocation.place, to: @office_allocation.to, user_id: @office_allocation.user_id }
    end

    assert_redirected_to office_allocation_path(assigns(:office_allocation))
  end

  test "should show office_allocation" do
    get :show, id: @office_allocation
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @office_allocation
    assert_response :success
  end

  test "should update office_allocation" do
    put :update, id: @office_allocation, office_allocation: { infot: @office_allocation.infot, location_status: @office_allocation.location_status, move_by_user_id: @office_allocation.move_by_user_id, office_id: @office_allocation.office_id, place: @office_allocation.place, to: @office_allocation.to, user_id: @office_allocation.user_id }
    assert_redirected_to office_allocation_path(assigns(:office_allocation))
  end

  test "should destroy office_allocation" do
    assert_difference('OfficeAllocation.count', -1) do
      delete :destroy, id: @office_allocation
    end

    assert_redirected_to office_allocations_path
  end
end
