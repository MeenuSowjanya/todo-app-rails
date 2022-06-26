class UsersController < ApplicationController
    def new
      render "users/new"
    end
    def index
      user = User.new
    end
    def create
        
      user = User.new(user_params) # )
        begin user.save
         redirect_to root_path
        rescue => exception
         render plain: "unsuccessfull"
        end
      
    end
      
    # def login

    # end

    # def login_check
    #   user = User.find_by({email: user_params[:email], password: user_params[:password]})
    #   if user 
    #     render plain: "true"
    #   else
    #     render plain: "false"
        
    #   end
      
    # end

    private 
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password)
    end

  end
  

