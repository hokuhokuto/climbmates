require 'test_helper'

class IventsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get ivents_new_url
    assert_response :success
  end

  test "should get create" do
    get ivents_create_url
    assert_response :success
  end

  test "should get update" do
    get ivents_update_url
    assert_response :success
  end

  test "should get destroy" do
    get ivents_destroy_url
    assert_response :success
  end

end
