module ApplicationHelper
  def navbar_button_login
    link_to 'LOGIN', '/login' unless user_signed_in?
  end

  def navbar_button_sign_up
    link_to 'REGISTER', signup_path unless user_signed_in?
  end

  def navbar_button_logout
    button_to 'LOGOUT', logout_path, { method: :delete, data: { confirm: 'Are you sure?' } } if user_signed_in?
  end

  def navbar_button_name
    link_to current_user.name, user_path(current_user) if user_signed_in?
  end

  private

  def user_signed_in?
    !current_user.nil?
  end

end
