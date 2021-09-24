require "test_helper"

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get terms_of_use" do
    get static_pages_terms_of_use_url
    assert_response :success
  end
end
