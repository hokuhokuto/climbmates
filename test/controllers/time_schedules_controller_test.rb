require 'test_helper'

class TimeSchedulesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get time_schedules_create_url
    assert_response :success
  end

  test "should get edit" do
    get time_schedules_edit_url
    assert_response :success
  end

  test "should get destroy" do
    get time_schedules_destroy_url
    assert_response :success
  end

end
