class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?, :admin?

  def current_user
  	@current_user ||= User.find(session[:user_id]) if session[:user_id]
  end 

  def logged_in?
  	current_user
  end

  def require_user
  	if logged_in?
  		flash[:danger] = "You must be logged in to perform that action"
  		redirect_to root_path and return
 		end
  end

  def admin?
    if current_user 
      current_user.admin
    end 
  end

  def require_admin
    if !admin?
      flash[:danger] = "You don't have admin access"
      redirect_to root_path and return
    end
  end

end
