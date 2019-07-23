class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception, prepend: true

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_in, keys: [:otp_attempt])
  end

  def after_sign_in_path_for(resource)
    if(current_user.admin?)
      "/users"
    elsif(current_user.check_in?)
      "/check_in"
    elsif(current_user.leaderboard?)
      "/leaderboard"
    elsif(current_user.coach?)
      "/users/edit"
    else
      "/users/edit"
    end
  end
end
