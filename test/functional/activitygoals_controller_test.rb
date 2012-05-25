require 'test_helper'

class ActivitygoalsControllerTest < ActionController::TestCase
  setup do
    @activitygoal = activitygoals(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:activitygoals)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create activitygoal" do
    assert_difference('Activitygoal.count') do
      post :create, activitygoal: { annuale: @activitygoal.annuale, annualm: @activitygoal.annualm, annuals: @activitygoal.annuals, annualstatus: @activitygoal.annualstatus, apre: @activitygoal.apre, aprm: @activitygoal.aprm, aprs: @activitygoal.aprs, aprstatus: @activitygoal.aprstatus, auge: @activitygoal.auge, augm: @activitygoal.augm, augs: @activitygoal.augs, augstatus: @activitygoal.augstatus, create_year: @activitygoal.create_year, dece: @activitygoal.dece, decm: @activitygoal.decm, decs: @activitygoal.decs, decstatus: @activitygoal.decstatus, febe: @activitygoal.febe, febm: @activitygoal.febm, febs: @activitygoal.febs, febstatus: @activitygoal.febstatus, goal_year: @activitygoal.goal_year, jane: @activitygoal.jane, janm: @activitygoal.janm, jans: @activitygoal.jans, janstatus: @activitygoal.janstatus, jule: @activitygoal.jule, julm: @activitygoal.julm, juls: @activitygoal.juls, julstatus: @activitygoal.julstatus, june: @activitygoal.june, junm: @activitygoal.junm, juns: @activitygoal.juns, junstatus: @activitygoal.junstatus, kind_goal_capture: @activitygoal.kind_goal_capture, mare: @activitygoal.mare, marm: @activitygoal.marm, mars: @activitygoal.mars, marstatus: @activitygoal.marstatus, maye: @activitygoal.maye, maym: @activitygoal.maym, mays: @activitygoal.mays, maystatus: @activitygoal.maystatus, name: @activitygoal.name, nove: @activitygoal.nove, novm: @activitygoal.novm, novs: @activitygoal.novs, novstatus: @activitygoal.novstatus, octe: @activitygoal.octe, octm: @activitygoal.octm, octs: @activitygoal.octs, octstatus: @activitygoal.octstatus, presentation_advances: @activitygoal.presentation_advances, sepe: @activitygoal.sepe, sepm: @activitygoal.sepm, seps: @activitygoal.seps, sepstatus: @activitygoal.sepstatus }
    end

    assert_redirected_to activitygoal_path(assigns(:activitygoal))
  end

  test "should show activitygoal" do
    get :show, id: @activitygoal
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @activitygoal
    assert_response :success
  end

  test "should update activitygoal" do
    put :update, id: @activitygoal, activitygoal: { annuale: @activitygoal.annuale, annualm: @activitygoal.annualm, annuals: @activitygoal.annuals, annualstatus: @activitygoal.annualstatus, apre: @activitygoal.apre, aprm: @activitygoal.aprm, aprs: @activitygoal.aprs, aprstatus: @activitygoal.aprstatus, auge: @activitygoal.auge, augm: @activitygoal.augm, augs: @activitygoal.augs, augstatus: @activitygoal.augstatus, create_year: @activitygoal.create_year, dece: @activitygoal.dece, decm: @activitygoal.decm, decs: @activitygoal.decs, decstatus: @activitygoal.decstatus, febe: @activitygoal.febe, febm: @activitygoal.febm, febs: @activitygoal.febs, febstatus: @activitygoal.febstatus, goal_year: @activitygoal.goal_year, jane: @activitygoal.jane, janm: @activitygoal.janm, jans: @activitygoal.jans, janstatus: @activitygoal.janstatus, jule: @activitygoal.jule, julm: @activitygoal.julm, juls: @activitygoal.juls, julstatus: @activitygoal.julstatus, june: @activitygoal.june, junm: @activitygoal.junm, juns: @activitygoal.juns, junstatus: @activitygoal.junstatus, kind_goal_capture: @activitygoal.kind_goal_capture, mare: @activitygoal.mare, marm: @activitygoal.marm, mars: @activitygoal.mars, marstatus: @activitygoal.marstatus, maye: @activitygoal.maye, maym: @activitygoal.maym, mays: @activitygoal.mays, maystatus: @activitygoal.maystatus, name: @activitygoal.name, nove: @activitygoal.nove, novm: @activitygoal.novm, novs: @activitygoal.novs, novstatus: @activitygoal.novstatus, octe: @activitygoal.octe, octm: @activitygoal.octm, octs: @activitygoal.octs, octstatus: @activitygoal.octstatus, presentation_advances: @activitygoal.presentation_advances, sepe: @activitygoal.sepe, sepm: @activitygoal.sepm, seps: @activitygoal.seps, sepstatus: @activitygoal.sepstatus }
    assert_redirected_to activitygoal_path(assigns(:activitygoal))
  end

  test "should destroy activitygoal" do
    assert_difference('Activitygoal.count', -1) do
      delete :destroy, id: @activitygoal
    end

    assert_redirected_to activitygoals_path
  end
end
