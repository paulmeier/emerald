require 'test_helper'

class MachineLocsControllerTest < ActionController::TestCase
  setup do
    @machine_loc = machine_locs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:machine_locs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create machine_loc" do
    assert_difference('MachineLoc.count') do
      post :create, machine_loc: { id: @machine_loc.id, location_id: @machine_loc.location_id, machine_id: @machine_loc.machine_id, raisedFloorLoc: @machine_loc.raisedFloorLoc }
    end

    assert_redirected_to machine_loc_path(assigns(:machine_loc))
  end

  test "should show machine_loc" do
    get :show, id: @machine_loc
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @machine_loc
    assert_response :success
  end

  test "should update machine_loc" do
    put :update, id: @machine_loc, machine_loc: { id: @machine_loc.id, location_id: @machine_loc.location_id, machine_id: @machine_loc.machine_id, raisedFloorLoc: @machine_loc.raisedFloorLoc }
    assert_redirected_to machine_loc_path(assigns(:machine_loc))
  end

  test "should destroy machine_loc" do
    assert_difference('MachineLoc.count', -1) do
      delete :destroy, id: @machine_loc
    end

    assert_redirected_to machine_locs_path
  end
end
