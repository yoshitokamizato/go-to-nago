require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get mypage" do
    get users_mypage_url
    assert_response :success
  end

end
