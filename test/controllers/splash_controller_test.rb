require 'test_helper'

class SplashControllerTest < ActionController::TestCase
  test "should get tour" do
    get :tour
    assert_response :success
  end

  test "should get login" do
    get :login
    assert_response :success
  end

  test "should get register" do
    get :register
    assert_response :success
  end

end
