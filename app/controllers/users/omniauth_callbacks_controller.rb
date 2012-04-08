class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    user = User.find_or_create_from_facebook request.env["omniauth.auth"]
    sign_in_and_redirect user, event: :authentication
  end
end

