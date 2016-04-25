class UsersController < ApplicationController
  include SessionsHelper
  before_action :auth_user, only: [:edit, :update]
  
  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.order(created_at: :desc).page(params[:page]).per(3)
    @followings = @user.following_users
    @followers = @user.follower_users
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "welcome to the Sample App!!"
      session[:user_id] = @user.id
      redirect_to @user
    else
      render 'new'
    end
  end
  
  def edit
   
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to @user , notice: 'success update'
    else
      render 'edit'
    end
  end
  
  def auth_user
    #binding.pry
    @user = User.find(params[:id])
    if @user != current_user
      redirect_to root_path
    end
  end
  
  def all_users
    @users = User.all.page(params[:page]).per(10)
  end
  
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :area , :age)
  end
end
