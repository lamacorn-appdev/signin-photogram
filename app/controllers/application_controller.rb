class ApplicationController < ActionController::Base
before_action(:authenticate_user!)

skip_before_action :verify_authenticity_token, raise: false

  before_action :configure_permitted_parameters, if: :devise_controller?



  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, :keys => [:username, :private])

    devise_parameter_sanitizer.permit(:account_update, :keys => [:private])
  end
end
