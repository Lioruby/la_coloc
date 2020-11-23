require 'test_helper'

class AssignationsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get assignations_show_url
    assert_response :success
  end

end
