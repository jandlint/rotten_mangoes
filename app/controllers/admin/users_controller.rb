class Admin::UsersController < ApplicationController

  before_action :restrict_access

  def index
    @users = User.all.page(params[:page]).per(10)
  end

  def create
  end

  def new
    @user = User.new
  end

  def edit
  end

  def show
  end

  def update
  end

  def destroy
    @user = User.find(params[:id])
    UserMailer.user_delete_notification(@user).deliver
    @user.destroy
    flash[:notice] = "User was deleted successfully."
    redirect_to admin_users_path
  end

end
