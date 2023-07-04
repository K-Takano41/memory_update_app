require "test_helper"

class BadEventsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get bad_events_new_url
    assert_response :success
  end

  test "should get create" do
    get bad_events_create_url
    assert_response :success
  end

  test "should get show" do
    get bad_events_show_url
    assert_response :success
  end

  test "should get edit" do
    get bad_events_edit_url
    assert_response :success
  end

  test "should get update" do
    get bad_events_update_url
    assert_response :success
  end

  test "should get destroy" do
    get bad_events_destroy_url
    assert_response :success
  end
end
