require "test_helper"

class ProductLikesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get product_likes_index_url
    assert_response :success
  end
end
