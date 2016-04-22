class UsersController < ApplicationController
  include SessionsHelper
  before_action :auth_user, only: [:edit, :update]
  
  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.order(created_at: :desc)
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "welcome to the Sample App!!"
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
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :area , :age)
  end
end
