require "test_helper"

class ImagesControllerTest < ActionDispatch::IntegrationTest
  test "should get generate" do
    get images_generate_url
    assert_response :success
  end
end
