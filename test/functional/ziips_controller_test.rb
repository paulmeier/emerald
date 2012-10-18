require 'test_helper'

class ZiipsControllerTest < ActionController::TestCase
  setup do
    @ziip = ziips(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ziips)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ziip" do
    assert_difference('Ziip.count') do
      post :create, ziip: { DateTime: @ziip.DateTime, LPAR: @ziip.LPAR, PCTBOX: @ziip.PCTBOX, id: @ziip.id }
    end

    assert_redirected_to ziip_path(assigns(:ziip))
  end

  test "should show ziip" do
    get :show, id: @ziip
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ziip
    assert_response :success
  end

  test "should update ziip" do
    put :update, id: @ziip, ziip: { DateTime: @ziip.DateTime, LPAR: @ziip.LPAR, PCTBOX: @ziip.PCTBOX, id: @ziip.id }
    assert_redirected_to ziip_path(assigns(:ziip))
  end

  test "should destroy ziip" do
    assert_difference('Ziip.count', -1) do
      delete :destroy, id: @ziip
    end

    assert_redirected_to ziips_path
  end
end
