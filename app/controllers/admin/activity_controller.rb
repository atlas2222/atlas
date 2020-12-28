module Admin
	class ActivityController < ApplicationController
	  before_action :authenticate_user!
  	  before_action :authorize_admin
	  def new
	  	@user = User.find(user_id)
	  	@activity = User.find(user_id).activities.new
	  end

	  def create
	  	user = User.find(user_id)
	  	activity = user.activities.new(activity_params)

	  	if activity.valid? and activity.save
	  	   flash[:notice] = "Activity has been added"
	  	   redirect_to new_admin_user_activity_path(user)
	  	else
	  		flash[:alert] = activity.errors.full_messages.to_sentence
	  		redirect_to new_admin_user_activity_path(user)
	  	end
	  end

	  protected

	  def activity_params
	  	params.require(:activity).permit(:date, :asset, :entry, :stoploss, :target_1, :target_2)
	  end

	  def user_id
	  	params[:user_id]
	  end
	end
end