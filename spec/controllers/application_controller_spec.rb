require 'rails_helper'

RSpec.describe ApplicationController, type: :controller do

  controller do
    def dummy
      render text: 'Hello world'
    end    
  end

  it { should use_before_action(:init_session) }

  describe ".init_session" do
    
    context 'when logged in' do
      login_user

      before(:each) do  
        routes.draw { get 'dummy' => 'anonymous#dummy' }
        get :dummy
      end      

      it 'should set @user with logged in user' do
        expect(@user.email).to eq('testuser@gmail.com')
      end
    end

    context 'when not logged in' do

      it 'should set @user with new user object' do
        expect(@user.email).not_to eq(nil)
        expect(@user.id).to eq(nil)
      end

    end 	
  end
  
end
