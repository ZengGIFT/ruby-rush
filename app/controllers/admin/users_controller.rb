class Admin::UsersController < ApplicationController
  def index
    @users = User.all
  end

  def active
    @user = User.find(params[:id])
    @user.is_actived = true
    @user.save!
    redirect_to admin_users_path
  end

  def dis_active
    @user = User.find(params[:id])
    @user.is_actived = false
    @user.save!
    redirect_to admin_users_path
  end

  def set_admin
    @user = User.find(params[:id])
    @user.is_admin = true
    @user.save!
    redirect_to admin_users_path
  end

  private

  def user_params
    params.require(:user).permit(:is_admin, :is_actived)
  end
end
