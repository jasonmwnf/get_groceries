class UsersController < ApplicationController
  binding.pry
  before_action :require_user, only: [:show]

  def index
    
  end
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:notice] = "Thanks for registering!"
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def show

    @user = User.find(params[:id])
    if session[:user_id] != params[:id].to_i
      flash[:error] = "You are not allowed to do that."
      redirect_to root_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end