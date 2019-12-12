require 'test_helper'

class Admins::ClientsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admins_clients_index_url
    assert_response :success
  end

end
