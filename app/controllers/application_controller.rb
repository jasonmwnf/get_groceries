class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?, :require_user

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def require_user
    if !logged_in? 
      flash[:error] = "You must be logged in to do that."
      redirect_to login_path
    end
  end 

  def wrong_user?
    if session[:user_id] != params[:user_id].to_i
      flash[:error] = "You are not allowed to do that."
      redirect_to root_path
    end
  end
end
