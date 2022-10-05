require "test_helper"

class Public::PrefecturesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get public_prefectures_show_url
    assert_response :success
  end
end
