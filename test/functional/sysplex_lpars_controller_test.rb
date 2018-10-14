require 'test_helper'

class SysplexLparsControllerTest < ActionController::TestCase
  setup do
    @sysplex_lpar = sysplex_lpars(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sysplex_lpars)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sysplex_lpar" do
    assert_difference('SysplexLpar.count') do
      post :create, sysplex_lpar: { id: @sysplex_lpar.id, lpar_id: @sysplex_lpar.lpar_id, sysplex_id: @sysplex_lpar.sysplex_id }
    end

    assert_redirected_to sysplex_lpar_path(assigns(:sysplex_lpar))
  end

  test "should show sysplex_lpar" do
    get :show, id: @sysplex_lpar
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @sysplex_lpar
    assert_response :success
  end

  test "should update sysplex_lpar" do
    put :update, id: @sysplex_lpar, sysplex_lpar: { id: @sysplex_lpar.id, lpar_id: @sysplex_lpar.lpar_id, sysplex_id: @sysplex_lpar.sysplex_id }
    assert_redirected_to sysplex_lpar_path(assigns(:sysplex_lpar))
  end

  test "should destroy sysplex_lpar" do
    assert_difference('SysplexLpar.count', -1) do
      delete :destroy, id: @sysplex_lpar
    end

    assert_redirected_to sysplex_lpars_path
  end
end
