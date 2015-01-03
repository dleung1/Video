require 'test_helper'

class UserControllerTest < ActionController::TestCase
  test "should get show" do
    get :show
    assert_response :success
  end

  test "should get edit" do
    get :edit
    assert_response :success
  end

  test "should get login" do
    get :login
    assert_response :success
  end

  test "should get create" do
    get :create
    assert_response :success
  end

  test "should get V_library" do
    get :V_library
    assert_response :success
  end

end
