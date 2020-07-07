class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  def session_authenticate
    redirect_to root_path unless current_user.present?
  end	

  rescue_from ActionController::RoutingError do |exception|
    logger.error 'Routing error occurred'
    render 'errors/404'
  end

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :password, :password_confirmation, :avatar, :small_bio])
      devise_parameter_sanitizer.permit(:account_update, keys: [:name, :email, :password, :password_confirmation, :avatar, :small_bio])
    end
end
