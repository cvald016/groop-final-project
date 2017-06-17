class SessionsController < ApplicationController

def create
    user = User.from_omniauth(request.env["omniauth.auth"])
    log_in user
    redirect_to user_path(user.id)
  end

   def destroy
    log_out
    redirect_to root_url
  end
  
end
