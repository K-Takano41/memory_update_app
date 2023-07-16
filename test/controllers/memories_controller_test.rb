require "test_helper"

class MemoriesControllerTest < ActionDispatch::IntegrationTest
  test "should get update" do
    get memories_update_url
    assert_response :success
  end
end
