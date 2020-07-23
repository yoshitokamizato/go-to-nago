require "test_helper"

class FacilitiesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get facilities_index_url
    assert_response :success
  end
end
