require 'test_helper'

class Db2sControllerTest < ActionController::TestCase
  setup do
    @db2 = db2s(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:db2s)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create db2" do
    assert_difference('Db2.count') do
      post :create, db2: { id: @db2.id, name: @db2.name }
    end

    assert_redirected_to db2_path(assigns(:db2))
  end

  test "should show db2" do
    get :show, id: @db2
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @db2
    assert_response :success
  end

  test "should update db2" do
    put :update, id: @db2, db2: { id: @db2.id, name: @db2.name }
    assert_redirected_to db2_path(assigns(:db2))
  end

  test "should destroy db2" do
    assert_difference('Db2.count', -1) do
      delete :destroy, id: @db2
    end

    assert_redirected_to db2s_path
  end
end
