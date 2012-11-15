require 'test_helper'

class NumberOfRoomsControllerTest < ActionController::TestCase
  setup do
    @number_of_room = number_of_rooms(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:number_of_rooms)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create number_of_room" do
    assert_difference('NumberOfRoom.count') do
      post :create, number_of_room: { description: @number_of_room.description, point: @number_of_room.point }
    end

    assert_redirected_to number_of_room_path(assigns(:number_of_room))
  end

  test "should show number_of_room" do
    get :show, id: @number_of_room
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @number_of_room
    assert_response :success
  end

  test "should update number_of_room" do
    put :update, id: @number_of_room, number_of_room: { description: @number_of_room.description, point: @number_of_room.point }
    assert_redirected_to number_of_room_path(assigns(:number_of_room))
  end

  test "should destroy number_of_room" do
    assert_difference('NumberOfRoom.count', -1) do
      delete :destroy, id: @number_of_room
    end

    assert_redirected_to number_of_rooms_path
  end
end
