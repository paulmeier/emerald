require 'test_helper'

class CustomerInformationControlSystemsControllerTest < ActionController::TestCase
  setup do
    @customer_information_control_system = customer_information_control_systems(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:customer_information_control_systems)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create customer_information_control_system" do
    assert_difference('CustomerInformationControlSystem.count') do
      post :create, customer_information_control_system: { id: @customer_information_control_system.id, name: @customer_information_control_system.name }
    end

    assert_redirected_to customer_information_control_system_path(assigns(:customer_information_control_system))
  end

  test "should show customer_information_control_system" do
    get :show, id: @customer_information_control_system
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @customer_information_control_system
    assert_response :success
  end

  test "should update customer_information_control_system" do
    put :update, id: @customer_information_control_system, customer_information_control_system: { id: @customer_information_control_system.id, name: @customer_information_control_system.name }
    assert_redirected_to customer_information_control_system_path(assigns(:customer_information_control_system))
  end

  test "should destroy customer_information_control_system" do
    assert_difference('CustomerInformationControlSystem.count', -1) do
      delete :destroy, id: @customer_information_control_system
    end

    assert_redirected_to customer_information_control_systems_path
  end
end
