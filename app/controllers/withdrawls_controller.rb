class WithdrawlsController < ApplicationController
  before_action :check_amount_param, only: [:new]
  before_action :authenticate_user!

  def new
  	@amount = params[:amount]

  	if current_user.balance >= @amount.to_i
  		transaction = current_user.transactions.new(amount: @amount.to_i)
  		transaction.withdrawl = true
  		transaction.pending = true
  		if transaction.save
  			current_user.decrement!(:balance, by = @amount.to_i)
  			flash[:notice] = "Withdraw request has been added succesfully"
  			redirect_to profile_path
  		else
  			flash[:alert] = "Unable to process the withdrawl request"
  			redirect_to profile_path
  		end
  	else
  		flash[:alert] = "Withdrawl amount must be less than or equal to your balance"
  		redirect_to profile_path
  	end
  end

  protected

  def check_amount_param 
  	unless params.has_key?(:amount) and params[:amount].to_i >= 500
		flash[:alert] = "Please set the amount higher than or equal to $500 while initiating payment"
	  	redirect_to profile_path
  	end
  end
end
