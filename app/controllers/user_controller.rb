class UserController < ApplicationController
  def new
    @user = User.new
  end
  
  def create
    @user = User.new
    @user.name = params[:user][:name]
    @user.email = params[:user][:email]
    @user.password = params[:user][:password]
    
    if @user.save
      flash[:notice] = "Welcome!"
    else
      flash.now[:alert] = "There was an error creating your account. Please try again."
    end
  end
  
  
end
