require 'test_helper'

class PeopleByRoomsControllerTest < ActionController::TestCase
  setup do
    @people_by_room = people_by_rooms(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:people_by_rooms)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create people_by_room" do
    assert_difference('PeopleByRoom.count') do
      post :create, people_by_room: { description: @people_by_room.description, point: @people_by_room.point }
    end

    assert_redirected_to people_by_room_path(assigns(:people_by_room))
  end

  test "should show people_by_room" do
    get :show, id: @people_by_room
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @people_by_room
    assert_response :success
  end

  test "should update people_by_room" do
    put :update, id: @people_by_room, people_by_room: { description: @people_by_room.description, point: @people_by_room.point }
    assert_redirected_to people_by_room_path(assigns(:people_by_room))
  end

  test "should destroy people_by_room" do
    assert_difference('PeopleByRoom.count', -1) do
      delete :destroy, id: @people_by_room
    end

    assert_redirected_to people_by_rooms_path
  end
end
