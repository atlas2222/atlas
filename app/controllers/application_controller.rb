class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?


	def after_sign_in_path_for(resource)
	    if current_user.admin?
	       admin_index_path
	    else
		   activities_path
	    end
	end

    def authorize_admin
       redirect_to root_path, alert: 'Access Denied, Admins Only.' unless current_user.admin?
    end

    protected

    def configure_permitted_parameters
    	devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    	devise_parameter_sanitizer.permit(:account_update, keys: [:name])
    end
end
