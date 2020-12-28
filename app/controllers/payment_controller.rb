class PaymentController < ApplicationController
  before_action :check_amount_param, only: [:initiate_payment]
  before_action :check_pending_param, only: [:payment_pending]
  before_action :authenticate_user!

  def initiate_payment
    @qr = Btc.first
    
  	@amount = params[:amount]
    @json = res = Faraday.get('https://blockchain.info/ticker').body
    @parsed_json = JSON.parse(@json)
    @current_price = @parsed_json['USD']['last']

    @btc_amount = Faraday.get('https://blockchain.info/tobtc?currency=USD&value=' + @amount)
    @btc_amoun_price = @btc_amount.body

  	# payment_url = "https://gateway.gear.mycelium.com/pp/a8dc285cfd36dd74726fc0a534dccfd9ae3778b30bf943dad0d823964c275edc?amount=" + amount.to_s + "&currency=USD&description=Deposit+your+money+to+Atlas"

  	# redirect_to payment_url
  end

  def payment_pending
  	@txn_amount = params[:txn_amount]

    transaction = current_user.transactions.new(amount: params[:txn_amount].to_i)
    transaction.deposit = true
    transaction.pending = true

    if transaction.save
      @txn_amount
    else
      flash[:alert] = "Error while completing the payment"
      redirect_to profile_path
    end
  end

  protected

  def check_amount_param 
  	unless params.has_key?(:amount) and params[:amount].to_i >= 5000
		flash[:alert] = "Please set the amount higher than or equal to $5000 while initiating payment"
	  	redirect_to profile_path
  	end
  end

  def check_pending_param
    unless params.has_key?(:txn_amount) and params[:txn_amount].to_i >= 5000
    flash[:alert] = "txn_amount is missing from the payment request"
      redirect_to profile_path 
    end
  end
end
