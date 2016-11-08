require 'test_helper'

class BuildingsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get '/buildings' 
    assert_response :success
  end

end
