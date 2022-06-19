require "test_helper"

class Admin::PostCosmesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_post_cosmes_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_post_cosmes_show_url
    assert_response :success
  end
end
