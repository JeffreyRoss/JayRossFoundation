class AdminController < ApplicationController

before_action :authenticate_user!
	
  def dashboard
  	@activeMenuPaths = Array['dashboard','admin'] 
  end

  def manageusers
  	@activeMenuPaths = Array['manageusers','admin'] 
  end
end
