require "test_helper"

class WikiControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get wiki_new_url
    assert_response :success
  end

  test "should get create" do
    get wiki_create_url
    assert_response :success
  end
end
