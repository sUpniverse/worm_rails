class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
  	if session[:user_id].nil?
  		@user = nil
  	else
  		@user = User.find(session[:user_id])
  	end
  end

  def authorize
    flash[:alert] = "로그인을 하고 글을 쓰세요~"
    redirect_to '/' if current_user.nil?
  end

  	helper_method :current_user
end
