require 'test_helper'

class ColocationsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get colocations_new_url
    assert_response :success
  end

  test "should get update" do
    get colocations_update_url
    assert_response :success
  end

  test "should get create" do
    get colocations_create_url
    assert_response :success
  end

  test "should get edit" do
    get colocations_edit_url
    assert_response :success
  end

end
