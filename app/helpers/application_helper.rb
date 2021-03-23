module ApplicationHelper
  def navbar_button_login
    link_to 'LOGIN', '/login' if session[:current_user] == nil
  end

  def navbar_bubtton_sign_in
    link_to 'REGISTER', '/login' if session[:current_user] == nil
  end

  def navbar_button_logout
  link_to 'LOGOUT' '/logout' if session[:curent_user] != nil
  end

  def navbar_button_name
    # link_to Logout '/logout' if session[:curent_user] != nil
  end
end
