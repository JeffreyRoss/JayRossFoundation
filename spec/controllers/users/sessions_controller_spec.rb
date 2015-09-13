require 'rails_helper'

RSpec.describe Users::SessionsController, type: :controller do
  describe "GET #new" do
    before(:each) do  
      @request.env["devise.mapping"] = Devise.mappings[:user] 
      get :new
    end

    it 'should set the Sign In page title' do
      pageTitle = "JRFoundation - Sign Up"
      expect(assigns(:pageTitle)).to eq(pageTitle)
    end   

    it 'should set the active menu paths' do
      activeMenuPaths = Array['dashboard','admin']
      expect(assigns(:activeMenuPaths)).to eq(activeMenuPaths)
    end     
  end

  describe "POST #create" do

    before(:each) do  
      @request.env["devise.mapping"] = Devise.mappings[:user] 
      get :create
    end

    it 'should set the active menu paths' do
      activeMenuPaths = Array['dashboard','admin'] 
      expect(assigns(:activeMenuPaths)).to eq(activeMenuPaths)
    end   

    it 'should authenticate user'

    context 'with authenticated user' do
      it 'sets the @user instance with the logged in user'
      it 'redirects to aboutUs'
    end

    context 'with unauthenticated user' do
      it 'should attempt to find user'
      it 'redirects to user session with alert if no email found'
      it 'redirects to user session with alert of invalid email'
    end   
  end
end