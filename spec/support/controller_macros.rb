module ControllerMacros
  def login_user
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      user = FactoryGirl.create(:user, first_name: 'testUser', middle_name: 'test', last_name: 'Washington', home_phone: '555-767-8798', mobile_phone: '850-545-2233', email: 'testUser@gmail.com', password: 'Password123')
      #user.confirm! # or set a confirmed_at inside the factory. Only necessary if you are using the "confirmable" module
      sign_in user
    end
  end

  def logout_user
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      #user.confirm! # or set a confirmed_at inside the factory. Only necessary if you are using the "confirmable" module
      sign_out @user
    end
  end  
end
