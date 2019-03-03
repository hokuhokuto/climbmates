require 'test_helper'

class GroupRelationshipsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get group_relationships_create_url
    assert_response :success
  end

  test "should get destroy" do
    get group_relationships_destroy_url
    assert_response :success
  end

end
