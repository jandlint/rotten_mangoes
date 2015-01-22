class Admin::UsersController < ApplicationController

  before_action :restrict_admin_access

  def index
    @users = User.all.page(params[:page]).per(10)
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to admin_users_path, notice: "User created successfully."
    else 
      redirect_to admin_users_path
    end
    
  end

  def change_user
    session[:user_id] = params[:id]
    redirect_to movies_path
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def show
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to admin_users_path, notice: "User edited successfully."
    else 
      render edit_admin_user_path
    end
  end

  def destroy
    @user = User.find(params[:id])
    UserMailer.user_delete_notification(@user).deliver
    @user.destroy
    flash[:notice] = "User was deleted successfully."
    redirect_to admin_users_path
  end

  protected

  def user_params
    params.require(:user).permit(:email, :firstname, :lastname, :password, :password_confirmation, :admin)
  end

end
