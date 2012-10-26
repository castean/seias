require 'test_helper'

class TypePeopleControllerTest < ActionController::TestCase
  setup do
    @type_person = type_people(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:type_people)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create type_person" do
    assert_difference('TypePerson.count') do
      post :create, type_person: { name: @type_person.name }
    end

    assert_redirected_to type_person_path(assigns(:type_person))
  end

  test "should show type_person" do
    get :show, id: @type_person
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @type_person
    assert_response :success
  end

  test "should update type_person" do
    put :update, id: @type_person, type_person: { name: @type_person.name }
    assert_redirected_to type_person_path(assigns(:type_person))
  end

  test "should destroy type_person" do
    assert_difference('TypePerson.count', -1) do
      delete :destroy, id: @type_person
    end

    assert_redirected_to type_people_path
  end
end
