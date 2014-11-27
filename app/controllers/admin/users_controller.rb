class Admin::UsersController < ApplicationController

  before_action :require_admin_access

  def index
    @users = User.all
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
  end

end
