class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  

  protected

  # Loops through a collection of UserEvent (groop) objects to put the event
  def user_events(user_events_array)
  	user_events_array.map do |user_event|
  		user_event.event
  	end
  end

  
end
