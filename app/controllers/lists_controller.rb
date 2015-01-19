class ListsController < ApplicationController
  before_action :require_user, :wrong_user?

  def show
    @list = List.find(params[:id])
    @user = User.find(params[:user_id])
  end

  def new
    @user = User.find(params[:user_id])
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    @user = User.find(params[:user_id])
    @list.user = @user 

    if @list.save
      flash[:notice] = "List Created"
      redirect_to user_path(@user)
    else
      flash[:alert] = "Please try again."
      render :new
    end
  end

  def edit
    @list = List.find(params[:id])
    @user = User.find(params[:user_id])
  end

  def update
    list = List.find(params[:id])
    list.title = params[:list][:title]
    @user = User.find(params[:user_id])

    if list.save
      flash[:notice] = "List has been updated"
      redirect_to user_path(@user)
    else
      flash[:alert] = "something went wrong"
      render :edit
    end
  end

  def destroy
    list = List.find(params[:id])
    user = User.find(params[:user_id])
    list.destroy
    redirect_to user_path(user)
  end

  private

  def list_params
    params.require(:list).permit(:title)
  end
end