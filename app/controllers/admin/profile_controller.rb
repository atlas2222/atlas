module Admin
  class ProfileController < ApplicationController
    before_action :authenticate_user!
    before_action :authorize_admin
    def new
    	@profile = User.find(user_id)
    end

    def create
    	profile = User.find(user_id)

    	if profile.update(profile_params)
    		flash[:notice] = "User profit has been updated"
    		redirect_to new_admin_user_profile_path(profile)
    	else
    		flash[:alert] = profile.errors.full_messages.to_sentence
    		redirect_to new_admin_user_profile_path(profile)
    	end
    end

    protected

    def user_id
    	params[:user_id]
    end

    def profile_params
    	params.require(:profile).permit(:profit, :balance)
    end
  end
end
