require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get users_show_url
    assert_response :success
  end

  test "should get unsubscribe" do
    get users_unsubscribe_url
    assert_response :success
  end

  test "should get retire" do
    get users_retire_url
    assert_response :success
  end

  test "should get complete" do
    get users_complete_url
    assert_response :success
  end

end
