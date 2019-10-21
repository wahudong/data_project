require 'test_helper'

class ElectoralWardsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get electoral_wards_index_url
    assert_response :success
  end

  test "should get show" do
    get electoral_wards_show_url
    assert_response :success
  end

end
