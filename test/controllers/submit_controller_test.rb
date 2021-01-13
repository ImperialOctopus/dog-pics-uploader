require "test_helper"

class SubmitControllerTest < ActionDispatch::IntegrationTest
  test "should get form" do
    get submit_form_url
    assert_response :success
  end

  test "should get result" do
    get submit_result_url
    assert_response :success
  end
end
