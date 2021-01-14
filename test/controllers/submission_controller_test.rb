require "test_helper"

class SubmissionControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get submission_show_url
    assert_response :success
  end

  test "should get new" do
    get submission_new_url
    assert_response :success
  end
end
