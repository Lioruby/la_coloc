class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  helper_method :current_colocation

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name])
  end

  private

  def current_colocation
    current_colocation ||= current_user.colocation
  end
end
