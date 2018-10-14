require 'test_helper'

class CpusControllerTest < ActionController::TestCase
  setup do
    @cpu = cpus(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cpus)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cpu" do
    assert_difference('Cpu.count') do
      post :create, cpu: { datetime: @cpu.datetime, id: @cpu.id, mips: @cpu.mips, smfid: @cpu.smfid }
    end

    assert_redirected_to cpu_path(assigns(:cpu))
  end

  test "should show cpu" do
    get :show, id: @cpu
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cpu
    assert_response :success
  end

  test "should update cpu" do
    put :update, id: @cpu, cpu: { datetime: @cpu.datetime, id: @cpu.id, mips: @cpu.mips, smfid: @cpu.smfid }
    assert_redirected_to cpu_path(assigns(:cpu))
  end

  test "should destroy cpu" do
    assert_difference('Cpu.count', -1) do
      delete :destroy, id: @cpu
    end

    assert_redirected_to cpus_path
  end
end
