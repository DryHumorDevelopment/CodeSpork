require 'test_helper'

class ForumsControllerTest < ActionController::TestCase
  test "should get html" do
    get :html
    assert_response :success
  end

  test "should get vb" do
    get :vb
    assert_response :success
  end

  test "should get cs" do
    get :cs
    assert_response :success
  end

  test "should get asp" do
    get :asp
    assert_response :success
  end

  test "should get rb" do
    get :rb
    assert_response :success
  end

  test "should get rails" do
    get :rails
    assert_response :success
  end

  test "should get php" do
    get :php
    assert_response :success
  end

  test "should get java" do
    get :java
    assert_response :success
  end

  test "should get js" do
    get :js
    assert_response :success
  end

  test "should get jq" do
    get :jq
    assert_response :success
  end

  test "should get mobile" do
    get :mobile
    assert_response :success
  end

end
