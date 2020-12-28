require 'test_helper'

class Admin::ProfileControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get admin_profile_new_url
    assert_response :success
  end

  test "should get create" do
    get admin_profile_create_url
    assert_response :success
  end

end
