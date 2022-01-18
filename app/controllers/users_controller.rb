class UsersController < ApplicationController
    
    before_action :set_user, only: [:show, :edit, :update, :destroy]
    
  def new
      @user = User.new
  end
  
  def create
      @user = User.new(user_params)
      if @user.save
          flash[:notice] = "User was successfully saved."
          redirect_to users_path
      else
         render 'new' 
      end
  end 

  def index
    @users = User.all
  end
  
  def show
      
  end
  
  def update
      if @user.update(user_params)
          flash[:notice] = "User was updated successfully"
          redirect_to @user
      else
          render 'edit'
      end
  end
  
  
  private
    
    def user_params
       params.require(:user).permit(:first_name, :last_name, :email, :password, :current_password, :access_level, :location_id) 
    end
    
    def set_user
      @user = User.find(params[:id])
    end

end