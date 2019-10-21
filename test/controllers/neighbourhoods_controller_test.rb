require 'test_helper'

class NeighbourhoodsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get neighbourhoods_index_url
    assert_response :success
  end

  test "should get show" do
    get neighbourhoods_show_url
    assert_response :success
  end

end
