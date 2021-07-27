class ApplicationController < ActionController::Base

  before_action :authenticate_user!
  #load_and_authorize_resource unless: :devise_controller?
  skip_authorization_check only: :upload

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, :alert => exception.message
  end

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

end
