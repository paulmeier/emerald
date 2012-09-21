require 'test_helper'

class LparConfigsControllerTest < ActionController::TestCase
  setup do
    @lpar_config = lpar_configs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:lpar_configs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create lpar_config" do
    assert_difference('LparConfig.count') do
      post :create, lpar_config: { codedWeight: @lpar_config.codedWeight, id: @lpar_config.id, ifl: @lpar_config.ifl, localEngines: @lpar_config.localEngines, lpar_id: @lpar_config.lpar_id, reservedStorage: @lpar_config.reservedStorage, runningWeight: @lpar_config.runningWeight, storageCbu: @lpar_config.storageCbu, storageNormal: @lpar_config.storageNormal, zaap: @lpar_config.zaap, zaapWeight: @lpar_config.zaapWeight, ziip: @lpar_config.ziip, ziipWeight: @lpar_config.ziipWeight }
    end

    assert_redirected_to lpar_config_path(assigns(:lpar_config))
  end

  test "should show lpar_config" do
    get :show, id: @lpar_config
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @lpar_config
    assert_response :success
  end

  test "should update lpar_config" do
    put :update, id: @lpar_config, lpar_config: { codedWeight: @lpar_config.codedWeight, id: @lpar_config.id, ifl: @lpar_config.ifl, localEngines: @lpar_config.localEngines, lpar_id: @lpar_config.lpar_id, reservedStorage: @lpar_config.reservedStorage, runningWeight: @lpar_config.runningWeight, storageCbu: @lpar_config.storageCbu, storageNormal: @lpar_config.storageNormal, zaap: @lpar_config.zaap, zaapWeight: @lpar_config.zaapWeight, ziip: @lpar_config.ziip, ziipWeight: @lpar_config.ziipWeight }
    assert_redirected_to lpar_config_path(assigns(:lpar_config))
  end

  test "should destroy lpar_config" do
    assert_difference('LparConfig.count', -1) do
      delete :destroy, id: @lpar_config
    end

    assert_redirected_to lpar_configs_path
  end
end
