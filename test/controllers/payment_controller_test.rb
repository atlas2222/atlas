require 'test_helper'

class PaymentControllerTest < ActionDispatch::IntegrationTest
  test "should get initiate_payment" do
    get payment_initiate_payment_url
    assert_response :success
  end

end
