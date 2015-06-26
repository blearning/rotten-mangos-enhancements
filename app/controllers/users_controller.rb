class UsersController < ApplicationController

  before_filter :restrict_admin_access, except: [:index, :new]
  #before_filter :restrict_admin_access, except: [:index, :new]

  def index
    @users = User.all
  end


  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    ## mail stuff
    if @user.save
      
      UserMailer.created_account_notification(@user).deliver

    ### mail stuff 
      session[:user_id] = @user.id
      redirect_to movies_path, notice: "Welcome aboard, #{@user.firstname}!"
    else
      render :new
    end
  end


  protected

  def user_params
    params.require(:user).permit(:email, :firstname, :lastname, :password, :password_confirmation)
  end

end