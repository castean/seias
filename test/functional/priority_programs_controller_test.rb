require 'test_helper'

class PriorityProgramsControllerTest < ActionController::TestCase
  setup do
    @priority_program = priority_programs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:priority_programs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create priority_program" do
    assert_difference('PriorityProgram.count') do
      post :create, priority_program: { date_end: @priority_program.date_end, date_start: @priority_program.date_start, description: @priority_program.description, name: @priority_program.name }
    end

    assert_redirected_to priority_program_path(assigns(:priority_program))
  end

  test "should show priority_program" do
    get :show, id: @priority_program
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @priority_program
    assert_response :success
  end

  test "should update priority_program" do
    put :update, id: @priority_program, priority_program: { date_end: @priority_program.date_end, date_start: @priority_program.date_start, description: @priority_program.description, name: @priority_program.name }
    assert_redirected_to priority_program_path(assigns(:priority_program))
  end

  test "should destroy priority_program" do
    assert_difference('PriorityProgram.count', -1) do
      delete :destroy, id: @priority_program
    end

    assert_redirected_to priority_programs_path
  end
end
