require 'test_helper'

class FavoriteControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get favorite_index_url
    assert_response :success
  end

  test "should get create" do
    get favorite_create_url
    assert_response :success
  end

  test "should get destroy" do
    get favorite_destroy_url
    assert_response :success
  end

end
