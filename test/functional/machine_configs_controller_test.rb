require 'test_helper'

class MachineConfigsControllerTest < ActionController::TestCase
  setup do
    @machine_config = machine_configs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:machine_configs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create machine_config" do
    assert_difference('MachineConfig.count') do
      post :create, machine_config: { capacity_id: @machine_config.capacity_id, cbu: @machine_config.cbu, centralStorage: @machine_config.centralStorage, crypto: @machine_config.crypto, es: @machine_config.es, fi: @machine_config.fi, icf: @machine_config.icf, id: @machine_config.id, ifb: @machine_config.ifb, machineLoc_id: @machine_config.machineLoc_id, machine_id: @machine_config.machine_id, mmodel_id: @machine_config.mmodel_id, osa: @machine_config.osa, type: @machine_config.type, ziip: @machine_config.ziip }
    end

    assert_redirected_to machine_config_path(assigns(:machine_config))
  end

  test "should show machine_config" do
    get :show, id: @machine_config
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @machine_config
    assert_response :success
  end

  test "should update machine_config" do
    put :update, id: @machine_config, machine_config: { capacity_id: @machine_config.capacity_id, cbu: @machine_config.cbu, centralStorage: @machine_config.centralStorage, crypto: @machine_config.crypto, es: @machine_config.es, fi: @machine_config.fi, icf: @machine_config.icf, id: @machine_config.id, ifb: @machine_config.ifb, machineLoc_id: @machine_config.machineLoc_id, machine_id: @machine_config.machine_id, mmodel_id: @machine_config.mmodel_id, osa: @machine_config.osa, type: @machine_config.type, ziip: @machine_config.ziip }
    assert_redirected_to machine_config_path(assigns(:machine_config))
  end

  test "should destroy machine_config" do
    assert_difference('MachineConfig.count', -1) do
      delete :destroy, id: @machine_config
    end

    assert_redirected_to machine_configs_path
  end
end
