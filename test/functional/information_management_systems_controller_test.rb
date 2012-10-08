require 'test_helper'

class InformationManagementSystemsControllerTest < ActionController::TestCase
  setup do
    @information_management_system = information_management_systems(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:information_management_systems)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create information_management_system" do
    assert_difference('InformationManagementSystem.count') do
      post :create, information_management_system: { id: @information_management_system.id, name: @information_management_system.name }
    end

    assert_redirected_to information_management_system_path(assigns(:information_management_system))
  end

  test "should show information_management_system" do
    get :show, id: @information_management_system
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @information_management_system
    assert_response :success
  end

  test "should update information_management_system" do
    put :update, id: @information_management_system, information_management_system: { id: @information_management_system.id, name: @information_management_system.name }
    assert_redirected_to information_management_system_path(assigns(:information_management_system))
  end

  test "should destroy information_management_system" do
    assert_difference('InformationManagementSystem.count', -1) do
      delete :destroy, id: @information_management_system
    end

    assert_redirected_to information_management_systems_path
  end
end
