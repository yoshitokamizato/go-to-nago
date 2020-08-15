class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(current_user.id)
    @facilities = current_user.bookmark_facilities.includes(:user).where(type: "spot").page(params[:page])
    @gourmets = current_user.bookmark_facilities.includes(:user).where(type: "gourmet").page(params[:page])

    return unless request.xhr?

    case params[:type]
    when "spot", "gourmet"
      render params[:type].to_s
    end
  end

  def withdraw; end
end
