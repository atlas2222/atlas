module Admin
	class EditController < ApplicationController
	  before_action :authenticate_user!
  	  before_action :authorize_admin

  	  def get_withdrawls
	  	@user = User.find(user)
	  	@transactions = User.find(user).transactions.where(withdrawl: true)
      end

      def get_deposits
	  	@user = User.find(user)
	  	@transactions = User.find(user).transactions.where(deposit: true)
      end

	  def transaction_edit
	  	@transaction = Transaction.find(transaction)
	  	if params[:transaction][:pending] == "true"
	  	  @transaction.pending = true
	  	  if @transaction.save
	  	  	flash[:notice] = "Transaction for #{@transaction.user.name} has been updated"
	  	  	redirect_to admin_index_path
	  	  else
	  	  	flash[:alert] = "Unable to update the transaction"
	  	  	redirect_to admin_index_path
	  	  end
	  	elsif params[:transaction][:pending] == "false"
	  	  @transaction.pending = false
	  	  if @transaction.save
	  	  	flash[:notice] = "Transaction #{@transaction.user.name} has been updated"
	  	  	redirect_to admin_index_path
	  	  else
	  	  	flash[:alert] = "Unable to update the transaction"
	  	  	redirect_to admin_index_path
	  	  end
	  	end
	  end

	  protected

	  def user
	  	params[:user_id]
	  end

	  def transaction
	  	params[:transaction_id]
	  end
	end
end