class UsersController < ApplicationController
    skip_before_action :ensure_user_logged_in
    def new
      render "users/new"
    end
    def index
      user = User.new
    end
    def create
        
      user = User.new(user_params) 
        if user.save
         session[:current_user_id] = user.id
         redirect_to root_path
        else
          flash[:error] = user.errors.full_messages.join(", ")
          redirect_to "users/new"
        end
      
    end
    
    private 
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password)
    end

  end
  

