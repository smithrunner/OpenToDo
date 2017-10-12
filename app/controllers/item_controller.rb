class ItemController < ApplicationController
  def create
    @user = User.find(params[:id])
    list = @user.list.find(params[:id])
    item = @user.list.item.new(item_params)
    
    if item.save
      flash[:notice] = "new item added!!"
    else
      flash.now[:alert] = "There was an error creating that item. Please try again."
    end
  end
  
  private
  def item_params
    params.require(:user, :list).permit(:item)
  end
  
  
end
