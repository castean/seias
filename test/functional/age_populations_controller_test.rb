require 'test_helper'

class AgePopulationsControllerTest < ActionController::TestCase
  setup do
    @age_population = age_populations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:age_populations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create age_population" do
    assert_difference('AgePopulation.count') do
      post :create, age_population: { age_range_id: @age_population.age_range_id, guardianship_id: @age_population.guardianship_id, institution_id: @age_population.institution_id, real_qty_registered: @age_population.real_qty_registered, sex_id: @age_population.sex_id, total_qty_registered: @age_population.total_qty_registered }
    end

    assert_redirected_to age_population_path(assigns(:age_population))
  end

  test "should show age_population" do
    get :show, id: @age_population
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @age_population
    assert_response :success
  end

  test "should update age_population" do
    put :update, id: @age_population, age_population: { age_range_id: @age_population.age_range_id, guardianship_id: @age_population.guardianship_id, institution_id: @age_population.institution_id, real_qty_registered: @age_population.real_qty_registered, sex_id: @age_population.sex_id, total_qty_registered: @age_population.total_qty_registered }
    assert_redirected_to age_population_path(assigns(:age_population))
  end

  test "should destroy age_population" do
    assert_difference('AgePopulation.count', -1) do
      delete :destroy, id: @age_population
    end

    assert_redirected_to age_populations_path
  end
end
