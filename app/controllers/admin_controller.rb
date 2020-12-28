class AdminController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_admin

  def index
  	@users = User.all
  end

  def users_activities
  	@activities = Activity.all
  end
  
end
