require 'test_helper'

class PedProgramsControllerTest < ActionController::TestCase
  setup do
    @ped_program = ped_programs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ped_programs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ped_program" do
    assert_difference('PedProgram.count') do
      post :create, ped_program: { description: @ped_program.description, name: @ped_program.name, ped_id: @ped_program.ped_id }
    end

    assert_redirected_to ped_program_path(assigns(:ped_program))
  end

  test "should show ped_program" do
    get :show, id: @ped_program
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ped_program
    assert_response :success
  end

  test "should update ped_program" do
    put :update, id: @ped_program, ped_program: { description: @ped_program.description, name: @ped_program.name, ped_id: @ped_program.ped_id }
    assert_redirected_to ped_program_path(assigns(:ped_program))
  end

  test "should destroy ped_program" do
    assert_difference('PedProgram.count', -1) do
      delete :destroy, id: @ped_program
    end

    assert_redirected_to ped_programs_path
  end
end
