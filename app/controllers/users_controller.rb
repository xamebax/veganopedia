class UsersController < ApplicationController
  def index
    @users = User.all
    respond_with @users
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
