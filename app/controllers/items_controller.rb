class ItemsController < ApplicationController
  before_action :require_user, :wrong_user? 
  def new
    @item = Item.new
    @user = User.find(params[:user_id])
    @list = List.find(params[:list_id])
  end

  def create
    @item = Item.new(item_params)
    @user = User.find(params[:user_id])
    @list = List.find(params[:list_id])
    @item.user_id = @user.id 
    @item.list_id = @list.id 

    if @item.save
      flash[:notice] = "Item has been added to list."
      redirect_to user_path(@user)
    else
      flash[:alert] = "Please try again."
      render :new
    end
  end

  def destroy
    item = Item.find_by id: params[:id].to_i
    item.destroy
    user = User.find(params[:user_id])
    flash[:alert] = "Item has been removed."
    redirect_to user_path(user)
  end

  private
  def item_params
    params.require(:item).permit(:name, :description)
  end
end