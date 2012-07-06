require 'test_helper'

class PedProgramDefinitionsControllerTest < ActionController::TestCase
  setup do
    @ped_program_definition = ped_program_definitions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ped_program_definitions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ped_program_definition" do
    assert_difference('PedProgramDefinition.count') do
      post :create, ped_program_definition: { description: @ped_program_definition.description, name: @ped_program_definition.name, ped_id: @ped_program_definition.ped_id }
    end

    assert_redirected_to ped_program_definition_path(assigns(:ped_program_definition))
  end

  test "should show ped_program_definition" do
    get :show, id: @ped_program_definition
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ped_program_definition
    assert_response :success
  end

  test "should update ped_program_definition" do
    put :update, id: @ped_program_definition, ped_program_definition: { description: @ped_program_definition.description, name: @ped_program_definition.name, ped_id: @ped_program_definition.ped_id }
    assert_redirected_to ped_program_definition_path(assigns(:ped_program_definition))
  end

  test "should destroy ped_program_definition" do
    assert_difference('PedProgramDefinition.count', -1) do
      delete :destroy, id: @ped_program_definition
    end

    assert_redirected_to ped_program_definitions_path
  end
end
