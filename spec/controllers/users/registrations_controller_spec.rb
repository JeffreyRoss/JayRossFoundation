require 'rails_helper'

RSpec.describe Users::RegistrationsController, type: :controller do
  describe "GET #new" do
  	before(:each) do  
      @request.env["devise.mapping"] = Devise.mappings[:user]	
  		get :new
  	end

  	it 'should set the Sign Up page title' do
  		pageTitle = "Sign Up"
  		expect(assigns(:pageTitle)).to eq(pageTitle)
  	end  	

  	it 'should set the active menu paths' do
  		activeMenuPaths = Array['dashboard','admin']
  		expect(assigns(:activeMenuPaths)).to eq(activeMenuPaths)
  	end    	
  end

  describe "POST #create" do

    context 'with valid attributes' do
      it 'creates a user'
      it 'redirects to aboutUs'
    end

    context 'with invalid attributes' do
      it 'does not create a user'
      it 're-renders the "new" view'
    end   
  end
end
