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
    redirect_to users_path, :notice => 'Successfully updated user.'
  rescue ActiveRecord::RecordInvalid, ActiveRecord::RecordNotSaved => e
    render :action => :edit
  end

  def destroy
    User.find(params[:id]).destroy
    redirect_to users_path, :notice => 'Successfully deleted user.'
  end
end
