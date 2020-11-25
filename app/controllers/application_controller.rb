class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  helper_method :current_colocation

  def after_sign_in_path_for(resource)
    user_path(resource) # your path
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name])
  end

  private

  def current_colocation
    current_colocation ||= current_user.colocation
  end
end
