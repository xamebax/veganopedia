class UsersController < ApplicationController
  def index
    @users = User.all :include => [:gender]
    respond_with @users
  end

  def show
    @user = User.find(params[:id])
    respond_with @user
  end

  def edit
    @user = User.find(params[:id])
    respond_with @user
  end

  def update
    @user = User.find(params[:id])
    @user.update_attributes!(params[:user])
    redirect_to users_path, :notice => successfully_updated(@user)
  rescue ActiveRecord::RecordInvalid, ActiveRecord::RecordNotSaved => e
    render :action => :edit
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path, :notice => successfully_destroyed(@user)
  end
end
