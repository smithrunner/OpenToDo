class ListController < ApplicationController
  def create
    @user = User.find(params[:id])
    list = @user.list.new(list_params)
  
    if list.save
      flash[:notice] = "new list created!!"
    else
      flash.now[:alert] = "There was an error creating that list. Please try again."
    end
  end
  
  private
  def list_params
    params.require(:user).permit(:priavte)
  end
  
end
