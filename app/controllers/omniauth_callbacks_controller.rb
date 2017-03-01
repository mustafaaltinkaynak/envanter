class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def all
    user = AdminUser.from_omniauth request.env['omniauth.auth']

    if user.present?
      sign_in_and_redirect user
    else
      flash.notice = 'Böyle bir kullanıcı yok'
      redirect_to new_admin_user_session_path
    end
  end

  alias google_oauth2 all
end
