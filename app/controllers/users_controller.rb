class UsersController < ApplicationController
  before_action :authorize_user
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :set_menu

  # GET /users
  # GET /users.json
  def index
    @pageTitle = "Manage Users"   
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @pageTitle = "Manage Users"   
  end

  # GET /users/new
  def new
    @admin = User.new
  end

  # GET /users/1/edit
  def edit
    @pageTitle = "Manage Users"       
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def authorize_user
      if not user_signed_in? 
        redirect_to :user_session, alert: 'You must log in first.'
      elsif current_user.role.name != 'admin'
        redirect_to :user_session, alert: 'You are not authorized to view this screen.'
      end 
    end 

    def set_menu
      @activeMenuPaths = Array['manageusers','admin'] 
    end    

    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:first_name, :middle_name, :last_name, :home_phone, :mobile_phone, :email)
    end
end
