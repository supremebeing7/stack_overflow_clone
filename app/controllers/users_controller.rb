class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if params[:user]
      @user.update(users_params)
    end
      redirect_to user_path
  end

  def create
    @user = User.create(users_params)
    redirect_to(root_path)
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to(root_path)
  end

private

  def users_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
