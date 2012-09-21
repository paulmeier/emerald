require 'test_helper'

class LparsControllerTest < ActionController::TestCase
  setup do
    @lpar = lpars(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:lpars)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create lpar" do
    assert_difference('Lpar.count') do
      post :create, lpar: { id: @lpar.id, mid: @lpar.mid, name: @lpar.name, smfid: @lpar.smfid }
    end

    assert_redirected_to lpar_path(assigns(:lpar))
  end

  test "should show lpar" do
    get :show, id: @lpar
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @lpar
    assert_response :success
  end

  test "should update lpar" do
    put :update, id: @lpar, lpar: { id: @lpar.id, mid: @lpar.mid, name: @lpar.name, smfid: @lpar.smfid }
    assert_redirected_to lpar_path(assigns(:lpar))
  end

  test "should destroy lpar" do
    assert_difference('Lpar.count', -1) do
      delete :destroy, id: @lpar
    end

    assert_redirected_to lpars_path
  end
end
