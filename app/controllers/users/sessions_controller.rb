class Users::SessionsController < Devise::SessionsController

before_filter :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  def new
    @activeMenuPaths = Array['dashboard','admin']
  end

  # POST /resource/sign_in
  def create
    #set menu vars incase i want to debug on this view TODO: learn how to utilize PRY instead
    @activeMenuPaths = Array['dashboard','admin']  

    #authenticate sign in creditials   
    user = User.where(email: params[:email], encrypted_password: params[:password])

    #validate return and redirect
    if user.empty?
      user = User.where(email: params[:email])
      if user.empty?
        redirect_to :user_session, alert: 'You have entered an invalid email address.'
      else
        redirect_to :user_session, alert: 'You have entered an incorrect email and password.'
      end
    else
      @user = user
      redirect_to :aboutus
    end
  end

  # DELETE /resource/sign_out
  def destroy
    sign_out_and_redirect(current_user) 
  end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_in_params
     devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:email, :password) }
   end

  private
  # Using a private method to encapsulate the permissible parameters
  def user_params
    params.require(:user).permit(:email, :password)
  end
end
