class ProfileController < ApplicationController
  before_action :authenticate_user!
  def profile_index
  	@transactions = current_user.transactions
  end
end
