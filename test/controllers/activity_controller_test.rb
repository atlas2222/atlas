require 'test_helper'

class ActivityControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get activity_new_url
    assert_response :success
  end

  test "should get create" do
    get activity_create_url
    assert_response :success
  end

end
