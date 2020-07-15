# ApplicationControler
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  rescue_from AbstractController::ActionNotFound, with: :not_found

  def record_not_found
    redirect_to root_path, notice: "Sorry, reccord not found"
  end

  def not_found
    respond_to do |format|
      format.html { render file: "#{Rails.root}/public/404.html", status: 404 }
      format.js { render nothing: true, status: 404 }
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :password, :password_confirmation, :avatar, :small_bio])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :email, :password, :password_confirmation, :avatar, :small_bio])
  end
end
