require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  test "should get home" do
    get :home
    assert_response :success
  end

  test "should get reports" do
    get :reports
    assert_response :success
  end

  test "should get configuration" do
    get :configuration
    assert_response :success
  end

  test "should get documents" do
    get :documents
    assert_response :success
  end

  test "should get about" do
    get :about
    assert_response :success
  end

end
