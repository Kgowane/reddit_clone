class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:firstname])
    devise_parameter_sanitizer.permit(:account_update, keys: [:firstname])

    devise_parameter_sanitizer.permit(:sign_up, keys: [:lastname])
    devise_parameter_sanitizer.permit(:account_update, keys: [:lastname])

    devise_parameter_sanitizer.permit(:sign_up, keys: [:profile_photo])
    devise_parameter_sanitizer.permit(:account_update, keys: [:profile_photo])
  end

end
