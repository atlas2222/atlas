class ActivitiesController < ApplicationController
  before_action :authenticate_user!
  
  def activities_index
  	@activities = current_user.activities
  end
end
