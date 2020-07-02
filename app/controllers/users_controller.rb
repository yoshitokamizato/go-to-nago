class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(current_user.id)
    @user.image
    @facilities = current_user.bookmark_facilities.includes(:user).where(type:"facilities").page(params[:page])
    @gourmets = current_user.bookmark_facilities.includes(:user).where(type:"gourmet").page(params[:page])
  end
end
