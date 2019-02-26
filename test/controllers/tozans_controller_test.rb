require 'test_helper'

class TozansControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get tozans_index_url
    assert_response :success
  end

  test "should get show" do
    get tozans_show_url
    assert_response :success
  end

  test "should get new" do
    get tozans_new_url
    assert_response :success
  end

  test "should get edit" do
    get tozans_edit_url
    assert_response :success
  end

end
