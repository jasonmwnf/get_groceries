class ListsController < ApplicationController

  def show
    @list = List.find(params[:id])
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

  private

  def list_params
    params.require(:list).permit(:title)
  end
end