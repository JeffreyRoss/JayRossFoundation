class AdminController < ApplicationController

before_action :authenticate_user!
	
  def dashboard
  	@activePaths = Array['dashboard','admin'] 
  end

  def manageusers
  	@activePaths = Array['manageusers','admin'] 
  end
end
