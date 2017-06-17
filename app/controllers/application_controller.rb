class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  private

  def requires_logged_in
    if current_user == nil
      redirect_to root_url #Only happens if current_user is equal to nil
    end
  end
  
  def current_user
    begin
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    rescue
      session[:user_id] = nil
      return nil
    end
  end
  
  helper_method :current_user

end
