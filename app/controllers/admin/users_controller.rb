class Admin::UsersController < ApplicationController

  before_filter :restrict_admin_access

  def index
    @users = User.all.page(params[:page]).per(5)
  end

  def show
    @users = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to admin_users_path, notice: "#{@user.firstname} was submitted successfully!"
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update_attributes(user_params)
      redirect_to admin_user_path(@user)
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