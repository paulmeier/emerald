require 'test_helper'

class CapacitiesControllerTest < ActionController::TestCase
  setup do
    @capacity = capacities(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:capacities)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create capacity" do
    assert_difference('Capacity.count') do
      post :create, capacity: { capSetting: @capacity.capSetting, id: @capacity.id, mips: @capacity.mips, msu: @capacity.msu, name: @capacity.name, number: @capacity.number }
    end

    assert_redirected_to capacity_path(assigns(:capacity))
  end

  test "should show capacity" do
    get :show, id: @capacity
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @capacity
    assert_response :success
  end

  test "should update capacity" do
    put :update, id: @capacity, capacity: { capSetting: @capacity.capSetting, id: @capacity.id, mips: @capacity.mips, msu: @capacity.msu, name: @capacity.name, number: @capacity.number }
    assert_redirected_to capacity_path(assigns(:capacity))
  end

  test "should destroy capacity" do
    assert_difference('Capacity.count', -1) do
      delete :destroy, id: @capacity
    end

    assert_redirected_to capacities_path
  end
end
