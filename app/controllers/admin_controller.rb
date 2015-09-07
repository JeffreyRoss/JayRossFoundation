class AdminController < ApplicationController

before_action :authorize_user
	
  def dashboard
    @pageTitle = "Dashboard"  	
  	@activeMenuPaths = Array['dashboard','admin'] 
  end

  def manageusers
    @pageTitle = "Manage Users"  	
  	@activeMenuPaths = Array['manageusers','admin'] 
  end

  protected 

  def authorize_user
  	if not user_signed_in? 
  		redirect_to :aboutus
  	elsif current_user.role.name != 'admin'
    	redirect_to :aboutus 
    end 
  end   
end
