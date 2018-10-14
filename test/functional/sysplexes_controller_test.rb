require 'test_helper'

class SysplexesControllerTest < ActionController::TestCase
  setup do
    @sysplex = sysplexes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sysplexes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sysplex" do
    assert_difference('Sysplex.count') do
      post :create, sysplex: { id: @sysplex.id, name: @sysplex.name }
    end

    assert_redirected_to sysplex_path(assigns(:sysplex))
  end

  test "should show sysplex" do
    get :show, id: @sysplex
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @sysplex
    assert_response :success
  end

  test "should update sysplex" do
    put :update, id: @sysplex, sysplex: { id: @sysplex.id, name: @sysplex.name }
    assert_redirected_to sysplex_path(assigns(:sysplex))
  end

  test "should destroy sysplex" do
    assert_difference('Sysplex.count', -1) do
      delete :destroy, id: @sysplex
    end

    assert_redirected_to sysplexes_path
  end
end
