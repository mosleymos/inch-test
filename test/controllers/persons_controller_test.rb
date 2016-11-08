require 'test_helper'

class PersonsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get '/persons' 
    assert_response :success
  end

end
