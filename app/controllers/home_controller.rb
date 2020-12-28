class HomeController < ApplicationController
  def index
  end

  def faq
  end

  def about
  end

  def contact
  end

  def subscribe
    email = params[:email]

    flash[:notice] = "Your email #{params[:email]} has been added to the subscription"
    redirect_to root_path
  end

  def post_message
    flash[:notice] = "Your message has been posted to the team, we will get in touch with you shortly"
    redirect_to home_contact_path
  end
end
