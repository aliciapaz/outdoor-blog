module ApplicationHelper
  def display_msg
    concat content_tag(:p, alert, class: 'alert') if alert.present?
    content_tag(:p, notice, class: 'notice') if notice.present?
  end

  def navbar_button_login
    link_to 'LOGIN', '/login', class: 'navbar-link' unless user_signed_in?
  end

  def navbar_button_sign_up
    link_to 'REGISTER', signup_path, class: 'navbar-link' unless user_signed_in?
  end

  def navbar_button_logout
    return unless user_signed_in?

    button_to 'LOGOUT', logout_path, { method: :delete, data: { confirm: 'Are you sure?' },
                                       class: 'navbar-link logout-btn' }
  end

  def navbar_button_name
    content_tag(:p, current_user.name, class: 'navbar-link') if user_signed_in?
  end

  private

  def user_signed_in?
    !current_user.nil?
  end
end
