require "test_helper"

class Public::PostCosmesControllerTest < ActionDispatch::IntegrationTest
  test "should get top" do
    get public_post_cosmes_top_url
    assert_response :success
  end

  test "should get show" do
    get public_post_cosmes_show_url
    assert_response :success
  end

  test "should get index" do
    get public_post_cosmes_index_url
    assert_response :success
  end

  test "should get new" do
    get public_post_cosmes_new_url
    assert_response :success
  end
end
