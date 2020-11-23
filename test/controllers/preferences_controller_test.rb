require 'test_helper'

class PreferencesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get preferences_new_url
    assert_response :success
  end

  test "should get create" do
    get preferences_create_url
    assert_response :success
  end

  test "should get index" do
    get preferences_index_url
    assert_response :success
  end

  test "should get update" do
    get preferences_update_url
    assert_response :success
  end

  test "should get edit" do
    get preferences_edit_url
    assert_response :success
  end

  test "should get index" do
    get preferences_index_url
    assert_response :success
  end

end
