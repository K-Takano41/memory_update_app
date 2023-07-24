require "test_helper"

class GoodEventsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get good_events_new_url
    assert_response :success
  end

  test "should get create" do
    get good_events_create_url
    assert_response :success
  end

  test "should get show" do
    get good_events_show_url
    assert_response :success
  end

  test "should get edit" do
    get good_events_edit_url
    assert_response :success
  end

  test "should get update" do
    get good_events_update_url
    assert_response :success
  end

  test "should get destroy" do
    get good_events_destroy_url
    assert_response :success
  end
end
