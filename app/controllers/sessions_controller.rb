class SessionsController < ApplicationController

  def new
  end

  def create 
    user = User.find_by(email: params[:email])
    begin user && user.authenticate(params[:password])
      render plain: "Successfull"
    rescue => exceptiom
      render plain: "Your login attempt was invalid, Please retry."
    end
  end
end
