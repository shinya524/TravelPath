require "test_helper"

class Admin::UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_users_index_url
    assert_response :success
  end

  test "should get edit" do
    get admin_users_edit_url
    assert_response :success
  end

  test "should get show" do
    get admin_users_show_url
    assert_response :success
  end

  test "should get stop" do
    get admin_users_stop_url
    assert_response :success
  end
end
