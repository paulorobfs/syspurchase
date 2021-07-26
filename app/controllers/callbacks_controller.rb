class CallbacksController < Devise::OmniauthCallbacksController


  def google_oauth2
    handle_auth "Google"
  end

  def facebook
    handle_auth "Facebook"
  end



  def handle_auth(kind)
    @user = User.from_omniauth(request.env["omniauth.auth"])
    if @user.persisted?
      flash[:notice] = "Success logged in #{kind}"
      sign_in_and_redirect @user, event: :authentication
    else
      redirect_to new_user_registration_url
    end
  end

  def failure
    redirect_to root_path
  end

end
