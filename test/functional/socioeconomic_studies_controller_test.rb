require 'test_helper'

class SocioeconomicStudiesControllerTest < ActionController::TestCase
  setup do
    @socioeconomic_study = socioeconomic_studies(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:socioeconomic_studies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create socioeconomic_study" do
    assert_difference('SocioeconomicStudy.count') do
      post :create, socioeconomic_study: { air_conditioning: @socioeconomic_study.air_conditioning, children_education: @socioeconomic_study.children_education, condition_id: @socioeconomic_study.condition_id, construction_material_floor: @socioeconomic_study.construction_material_floor, construction_material_roof: @socioeconomic_study.construction_material_roof, construction_material_wall: @socioeconomic_study.construction_material_wall, description_evaluation_general: @socioeconomic_study.description_evaluation_general, dvd: @socioeconomic_study.dvd, environment: @socioeconomic_study.environment, family_dinamyc: @socioeconomic_study.family_dinamyc, family_history: @socioeconomic_study.family_history, fridge: @socioeconomic_study.fridge, health: @socioeconomic_study.health, heritage_assets: @socioeconomic_study.heritage_assets, housing_feature_id: @socioeconomic_study.housing_feature_id, labor_company: @socioeconomic_study.labor_company, labor_time: @socioeconomic_study.labor_time, labor_work_seniority: @socioeconomic_study.labor_work_seniority, microweave: @socioeconomic_study.microweave, neighbor_references: @socioeconomic_study.neighbor_references, number_of_room_id: @socioeconomic_study.number_of_room_id, people_by_room_id: @socioeconomic_study.people_by_room_id, person_id: @socioeconomic_study.person_id, phone: @socioeconomic_study.phone, relationship_id: @socioeconomic_study.relationship_id, service_drainage: @socioeconomic_study.service_drainage, service_electricity: @socioeconomic_study.service_electricity, service_gas: @socioeconomic_study.service_gas, service_paving: @socioeconomic_study.service_paving, service_phone: @socioeconomic_study.service_phone, service_transportation: @socioeconomic_study.service_transportation, service_water: @socioeconomic_study.service_water, spending_auto: @socioeconomic_study.spending_auto, spending_education: @socioeconomic_study.spending_education, spending_food: @socioeconomic_study.spending_food, spending_monthly_payment: @socioeconomic_study.spending_monthly_payment, spending_other: @socioeconomic_study.spending_other, spending_payment: @socioeconomic_study.spending_payment, spending_rent: @socioeconomic_study.spending_rent, stove: @socioeconomic_study.stove, study_person_name: @socioeconomic_study.study_person_name, study_place: @socioeconomic_study.study_place, total_point: @socioeconomic_study.total_point }
    end

    assert_redirected_to socioeconomic_study_path(assigns(:socioeconomic_study))
  end

  test "should show socioeconomic_study" do
    get :show, id: @socioeconomic_study
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @socioeconomic_study
    assert_response :success
  end

  test "should update socioeconomic_study" do
    put :update, id: @socioeconomic_study, socioeconomic_study: { air_conditioning: @socioeconomic_study.air_conditioning, children_education: @socioeconomic_study.children_education, condition_id: @socioeconomic_study.condition_id, construction_material_floor: @socioeconomic_study.construction_material_floor, construction_material_roof: @socioeconomic_study.construction_material_roof, construction_material_wall: @socioeconomic_study.construction_material_wall, description_evaluation_general: @socioeconomic_study.description_evaluation_general, dvd: @socioeconomic_study.dvd, environment: @socioeconomic_study.environment, family_dinamyc: @socioeconomic_study.family_dinamyc, family_history: @socioeconomic_study.family_history, fridge: @socioeconomic_study.fridge, health: @socioeconomic_study.health, heritage_assets: @socioeconomic_study.heritage_assets, housing_feature_id: @socioeconomic_study.housing_feature_id, labor_company: @socioeconomic_study.labor_company, labor_time: @socioeconomic_study.labor_time, labor_work_seniority: @socioeconomic_study.labor_work_seniority, microweave: @socioeconomic_study.microweave, neighbor_references: @socioeconomic_study.neighbor_references, number_of_room_id: @socioeconomic_study.number_of_room_id, people_by_room_id: @socioeconomic_study.people_by_room_id, person_id: @socioeconomic_study.person_id, phone: @socioeconomic_study.phone, relationship_id: @socioeconomic_study.relationship_id, service_drainage: @socioeconomic_study.service_drainage, service_electricity: @socioeconomic_study.service_electricity, service_gas: @socioeconomic_study.service_gas, service_paving: @socioeconomic_study.service_paving, service_phone: @socioeconomic_study.service_phone, service_transportation: @socioeconomic_study.service_transportation, service_water: @socioeconomic_study.service_water, spending_auto: @socioeconomic_study.spending_auto, spending_education: @socioeconomic_study.spending_education, spending_food: @socioeconomic_study.spending_food, spending_monthly_payment: @socioeconomic_study.spending_monthly_payment, spending_other: @socioeconomic_study.spending_other, spending_payment: @socioeconomic_study.spending_payment, spending_rent: @socioeconomic_study.spending_rent, stove: @socioeconomic_study.stove, study_person_name: @socioeconomic_study.study_person_name, study_place: @socioeconomic_study.study_place, total_point: @socioeconomic_study.total_point }
    assert_redirected_to socioeconomic_study_path(assigns(:socioeconomic_study))
  end

  test "should destroy socioeconomic_study" do
    assert_difference('SocioeconomicStudy.count', -1) do
      delete :destroy, id: @socioeconomic_study
    end

    assert_redirected_to socioeconomic_studies_path
  end
end
