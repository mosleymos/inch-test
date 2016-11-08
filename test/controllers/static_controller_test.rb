require 'test_helper'

class StaticControllerTest < ActionDispatch::IntegrationTest
  test "should get not_found" do
    get '/not_found'
    assert_response :not_found
  end

  test "should get server_error" do
    get '/server_error'
    assert_response :internal_server_error
  end

  test "should get notification" do
    get '/notification'
    assert_response :success
  end

end
