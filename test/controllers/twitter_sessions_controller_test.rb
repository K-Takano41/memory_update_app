require "test_helper"

class TwitterSessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get twitter_sessions_create_url
    assert_response :success
  end
end
