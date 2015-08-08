class Users::SessionsController < Devise::SessionsController
# before_filter :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  def new
    @activeMenuPaths = Array['dashboard','admin']
  end

  # POST /resource/sign_in
  def create
    @activeMenuPaths = Array['dashboard','admin']    
    @user = User.where(email: params[:email], encrypted_password: params[:password])

    if @user.nil?
      redirect_to :aboutus
    else
      redirect_to :user_session
    end
  end

  # DELETE /resource/sign_out
  def destroy
    sign_out_and_redirect(current_user) 
  end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.for(:sign_in) << :attribute
  # end

  private
  # Using a private method to encapsulate the permissible parameters
  def user_params
    params.require(:user).permit(:email, :password)
  end
end
