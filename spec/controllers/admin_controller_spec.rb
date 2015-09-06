require 'rails_helper'

RSpec.describe AdminController, type: :controller do
  login_user
  
  describe "GET #dashboard" do
  	before(:each) do  
  		get :dashboard
  	end

  	it 'should set the page title to dahsboard' do
  		pageTitle = "Dashboard"
  		expect(assigns(:pageTitle)).to eq(pageTitle)
  	end  	

  	it 'should set the Dashboard active menu paths' do
  		activeMenuPaths = Array['dashboard','admin'] 
  		expect(assigns(:activeMenuPaths)).to eq(activeMenuPaths)
  	end    	
  end

  describe "GET #manageusers" do
  	before(:each) do  
  		get :manageusers
  	end

  	it 'should set the page title to Manage Users' do
  		pageTitle = "Manage Users"
  		expect(assigns(:pageTitle)).to eq(pageTitle)
  	end  	

  	it 'should set the Mange Users active menu paths' do
  		activeMenuPaths = Array['manageusers','admin'] 
  		expect(assigns(:activeMenuPaths)).to eq(activeMenuPaths)
  	end    	
  end  

end
