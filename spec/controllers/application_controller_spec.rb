require 'rails_helper'

RSpec.describe ApplicationController, type: :controller do

  login_user   

  controller do
    def index
      init_session
      render text: 'hello world'
    end    
  end

  it { should use_before_action(:init_session) }

  describe ".init_session" do
    
    context 'when logged in' do


      before(:each) do 
        get :index
      end      

      it 'should set @user with logged in user' do
        assigns[:user] == assigns[:current_user]
      end
    end

    context 'when not logged in' do
      logout_user

      before(:each) do 
        get :index
      end         

      it 'should set @user with new user object' do
        assigns[:user] == User.new
      end

    end 	
  end
  
end
