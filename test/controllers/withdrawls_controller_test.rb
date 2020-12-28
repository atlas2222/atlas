require 'test_helper'

class WithdrawlsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get withdrawls_new_url
    assert_response :success
  end

  test "should get create" do
    get withdrawls_create_url
    assert_response :success
  end

end
