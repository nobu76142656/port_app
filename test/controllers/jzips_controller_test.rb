require 'test_helper'

class JzipsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get jzips_index_url
    assert_response :success
  end

end
