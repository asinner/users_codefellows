class UsersController < ApplicationController
  def index
    @users = User.all
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    
    respond_to do |format|
      if @user.save
        format.html { redirect_to users_path, flash: { success: 'User added' } }
        format.js
      else
        format.html { render :new }
        format.js
      end
    end
  end
  
  def edit
    @user = User.find(params[:id])
    
    respond_to do |format|
      format.html
      format.js
    end
  end
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_path, flash: { success: 'User removed' } }
      format.js
    end
  end
  
  def update
    @user = User.find(params[:id])
    
    respond_to do |format|
      if @user.update_attributes(user_params)
        format.html { redirect_to users_path, flash: { success: 'User updated' } }
        format.js
      else
        format.html { render :edit }
        format.js
      end
    end
  end
  
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email)
  end
end
