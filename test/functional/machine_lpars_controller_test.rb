require 'test_helper'

class MachineLparsControllerTest < ActionController::TestCase
  setup do
    @machine_lpar = machine_lpars(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:machine_lpars)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create machine_lpar" do
    assert_difference('MachineLpar.count') do
      post :create, machine_lpar: { id: @machine_lpar.id, lpar_id: @machine_lpar.lpar_id, machine_id: @machine_lpar.machine_id }
    end

    assert_redirected_to machine_lpar_path(assigns(:machine_lpar))
  end

  test "should show machine_lpar" do
    get :show, id: @machine_lpar
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @machine_lpar
    assert_response :success
  end

  test "should update machine_lpar" do
    put :update, id: @machine_lpar, machine_lpar: { id: @machine_lpar.id, lpar_id: @machine_lpar.lpar_id, machine_id: @machine_lpar.machine_id }
    assert_redirected_to machine_lpar_path(assigns(:machine_lpar))
  end

  test "should destroy machine_lpar" do
    assert_difference('MachineLpar.count', -1) do
      delete :destroy, id: @machine_lpar
    end

    assert_redirected_to machine_lpars_path
  end
end
