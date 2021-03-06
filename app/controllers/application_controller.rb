class ApplicationController < ActionController::Base
  # CSRF(クロスサイトリクエストフォージェリ) 対策
  protect_from_forgery
  # before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protect_from_forgery with: :exception


  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :birth_year, :sex, :prefecture, :image, :profile, :mailmagazine])
    devise_parameter_sanitizer.permit(:account_update, keys: [:nickname, :birth_year, :sex, :prefecture, :image, :profile, :mailmagazine])
  end
end
