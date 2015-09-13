class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :init_session

  protected

  def init_session

  	if user_signed_in? 
  		@user = current_user
  	else
    	@user = User.new  
    end 
  end 
end
