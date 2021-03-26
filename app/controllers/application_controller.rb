class ApplicationController < ActionController::Base
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  helper_method :current_user

  rescue_from ActionController::InvalidAuthenticityToken, with: :bad_token
  def bad_token
    flash[:warning] = 'Session expired'
    redirect_to root_path
  end
end
