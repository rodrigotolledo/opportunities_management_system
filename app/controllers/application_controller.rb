class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user, :student?, :company?, :director?

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def student?
  	@who_is ||= User.find(session[:user_id]).type_user if session[:user_id]
  	if @who_is == "student" || @who_is == nil
  		true
  	end
  end

  def company?
  	@who_is ||= User.find(session[:user_id]).type_user if session[:user_id]
  	if @who_is == "company"
  		true
  	end
  end

  def director?
  	@who_is ||= User.find(session[:user_id]).type_user if session[:user_id]
  	if @who_is == "director"
  		true
  	end
  end
end
