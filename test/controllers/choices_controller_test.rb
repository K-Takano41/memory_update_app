require "test_helper"

class ChoicesControllerTest < ActionDispatch::IntegrationTest
  test "should get choices" do
    get choices_choices_url
    assert_response :success
  end
end
