class Admin::UsersController < ApplicationController

  before_filter :restrict_admin_access

  def index
    @users = User.all.page(params[:page]).per(5)
  end

  def edit
    @users = User.find(params[:id])
  end

  def update
    @users = User.find(params[:id])

    if @movie.update_attributes(user_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def destroy
    #TODO check that you're not deleting yourselfß
    @user = User.find(params[:id])
    @user.destroy
    redirect_to admin_users_path
  end

  protected

  def user_params
    params.require(:user).permit(:email, :firstname, :lastname, :password, :password_confirmation)
  end




end