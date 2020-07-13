class ApplicationController < ActionController::Base
  # before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :birth_year, :sex, :prefecture, :image, :profile])
    devise_parameter_sanitizer.permit(:account_update, keys: [:nickname, :birth_year, :sex, :prefecture, :image, :profile, :image_cache])
  end
end
