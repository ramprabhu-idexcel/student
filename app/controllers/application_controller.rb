class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end
  include SessionsHelper
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  #Customize the Devise after_sign_in_path_for() for redirecct to previous page after login
  def after_sign_in_path_for(resource_or_scope)
    case resource_or_scope
      when :user, User
        store_location = session[:return_to]
        clear_stored_location
        store_location = "/" if store_location && store_location.include?("/users/")
        (store_location.nil?) ? "/" : store_location.to_s
      else
        super
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:first_name,:last_name,:role,:phone_number,:alternative_number,:address, :email, :password, :password_confirmation) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:first_name,:last_name,:role,:phone_number,:alternative_number,:address, :email, :password, :password_confirmation) }
  end

end
