class SessionsController < ApplicationController
  protect_from_forgery with: :exception
  def new; end

  def create
    @user = User.find_by(name: params[:name])
    if @user
      session[:user_id] = @user.id
      redirect_to root_path
    else
      redirect_to login_path
      flash.alert = 'Name not registered'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
