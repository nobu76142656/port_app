require 'test_helper'

class WordsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get words_index_url
    assert_response :success
  end

  test "should get show" do
    get words_show_url
    assert_response :success
  end

  test "should get answer" do
    get words_answer_url
    assert_response :success
  end

end
