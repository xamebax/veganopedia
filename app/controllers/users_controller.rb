class UsersController < ApplicationController
  def index
    @users = User.all
    respond_with @users
  end

  def show
    @user = User.find(params[:id])
    respond_with @user
  end

  def new
    @user = User.new
    respond_with @user
  end

  def create

  end

  def edit
    @user = User.find(params[:id])
    respond_with @user
  end

  def update

    redirect_to users_path, :notice => 'Successfully deleted user.'
  end

  def destroy
    User.find(params[:id])
    redirect_to users_path, :notice => 'Successfully deleted user.'
  end
end
