class Users::RegistrationsController < Devise::RegistrationsController

#before_filter :configure_sign_up_params, only: [:create]
# before_filter :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  def new
    #set page title
    @pageTitle = "Sign Up"

    #set menu vars
    @activeMenuPaths = Array['dashboard','admin']
  end

  # POST /resource
  def create
    #set menu vars
    @activeMenuPaths = Array['dashboard','admin']

    #build user from sing up form
    @user = User.new(user_params)

    #valid user obj and save or redirect
    if @user.valid?
      @user.save
      redirect_to :aboutus
    else
      @user.save
      render 'new'
    end

  end

  # GET /resource/edit
  def edit
  #   super
  end

  # PUT /resource
  def update
  #   super
  end

  # DELETE /resource
  def destroy
  #   super
  end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  #protected

  # If you have extra params to permit, append them to the sanitizer.
  #def configure_sign_up_params
     #devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:first_name, :middle_name, :last_name, :home_phone, :mobile_phone, :email, :password, :encrypted_password) } 
  #end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.for(:account_update) << :attribute
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
  private
  # Using a private method to encapsulate the permissible parameters
  def user_params
    params.require(:user).permit(:first_name, :middle_name, :last_name, :home_phone, :mobile_phone, :email, :password)
  end
end
