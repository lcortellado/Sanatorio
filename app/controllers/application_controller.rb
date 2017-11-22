class ApplicationController < ActionController::Base
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  
    before_filter :configure_permitted_parameters, if: :devise_controller?

    protected

       devise_parameter_sanitizer.permit(:sign_up) do |u| 
    u.permit(:email, :password, :password_confirmation, :name)
  end
  end
end
