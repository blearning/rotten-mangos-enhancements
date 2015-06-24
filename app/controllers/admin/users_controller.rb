class Admin::UsersController < ApplicationController

  before_filter :restrict_admin_access

  def index
    @users = User.all.page(params[:page]).per(5)
  end

  def show
    @users = User.find(params[:id])
  end

  def new
    @users = User.new
  end

  def create
    @users = User.new(user_params)

    if @users.save
      redirect_to admin_users_path, notice: "#{@users.firstname} was submitted successfully!"
    else
      render :new
    end
  end

  def edit
    @users = User.find(params[:id])
  end

  def update
    @users = User.find(params[:id])

    if @users.update_attributes(user_params)
      redirect_to admin_users_path + "/#{params[:id]}"
    else
      render :edit
    end
  end

  def destroy
    #TODO check that you're not deleting yourselfß
    @user = User.find(params[:id])
    UserMailer.deleted_account_notification(@user).deliver
    @user.destroy
    redirect_to admin_users_path 
  end

  protected

  def user_params
    params.require(:user).permit(:email, :firstname, :lastname, :password, :password_confirmation, :admin)
  end




end