class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    user = User.find_or_create_from_facebook request.env["omniauth.auth"]
    if user.has_mobile_number?
      sign_in_and_redirect user, event: :authentication
    else
      sign_in user
      redirect_to edit_user_path user
    end
  end
end

