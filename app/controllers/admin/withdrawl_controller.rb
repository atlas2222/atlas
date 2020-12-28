module Admin
	class WithdrawlController < ApplicationController
	before_action :authenticate_user!
  	before_action :authorize_admin
  	
	  def new
	  	@user = User.find(user)
	  	@transactions = User.find(user).transactions.where(withdrawl: true)
	  end

	  protected

	  def user
	  	params[:user_id]
	  end

	  def deposit_transaction
	  	params[:id]
	  end
	end
end