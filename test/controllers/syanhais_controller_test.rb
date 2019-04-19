require 'test_helper'

class SyanhaisControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get syanhais_index_url
    assert_response :success
  end

end
