class AdminController < ApplicationController

before_action :authenticate_user!
	
  def dashboard
    @pageTitle = "Dashboard"  	
  	@activeMenuPaths = Array['dashboard','admin'] 
  end

  def manageusers
    @pageTitle = "Manage Users"  	
  	@activeMenuPaths = Array['manageusers','admin'] 
  end
end
