require 'test_helper'

class Admins::RoundsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admins_rounds_index_url
    assert_response :success
  end

end
