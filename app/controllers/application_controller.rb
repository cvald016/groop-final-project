class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  helper_method :time_formatter
  helper_method :friend_gen

  protected

  # Loops through a collection of UserEvent (groop) objects to put the event
  def user_events(user_events_array)
  	user_events_array.map do |user_event|
  		user_event.event
  	end
  end

  def time_formatter(date)
    date.strftime("%A, %B %d, %Y - %I:%M %p")
  end

  # For demo purposes
  def friend_gen
    rand(100...273)
  end

end
