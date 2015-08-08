class Users::RegistrationsController < Devise::RegistrationsController
# before_filter :configure_sign_up_params, only: [:create]
# before_filter :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  def new
    @activeMenuPaths = Array['dashboard','admin']
  end

  # POST /resource
  def create
    @activeMenuPaths = Array['dashboard','admin']
    @user = User.new(email:'Jeffrey1.ross@gmail.com', first_name:'Jeffrey', middle_name:'R',last_name:'Ross',home_phone:'850-766-3855',mobile_phone:'453-545-6767',password:'Password123',password_confirmation:'Password123')
    @user.save
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

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.for(:sign_up) << :attribute
  # end

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
    params.require(:user).permit(:email, :password)
  end
end
