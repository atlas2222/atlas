module Admin
	class QrController < ApplicationController
	before_action :authenticate_user!
  	before_action :authorize_admin
	  def new
	  	@btc = Btc.new
	  end

	  def create
	  	@btc = Btc.new(btc_params)

	  	if @btc.save
	  		flash[:notice] = "Btc has been added"
	  		redirect_to admin_index_path
	  	else
	  		flash[:alert] = "Error saving the Btc"
	  		redirect_to admin_index_path
	  	end
	  end

	  def edit
	  	@btc = Btc.first
	  end

	  def update
	  	@btc = Btc.first

	  	if @btc.update_attributes(btc_params)
	  		flash[:notice] = "Btc has been updated"
	  		redirect_to admin_index_path
	  	else
	  		flash[:alert] = "Error updating the Btc"
	  		redirect_to admin_index_path
	  	end
	  end

	  protected

	  def btc_params
	  	params.require(:btc).permit(:image, :address)
	  end
	end
end