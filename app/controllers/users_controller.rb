class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(current_user.id)
    @spots = current_user.bookmark_facilities.includes(:user).where(type: "spot").page(params[:page])
    @gourmets = current_user.bookmark_facilities.includes(:user).where(type: "gourmet").page(params[:page])

    return unless request.xhr?

    case params[:type]
    # when "spot", "gourmet"
      # render params[:type].to_s
    when "bookmark_spot", "bookmark_gourmet"
      @bookmark_type = params[:type]
      render 'facilities/bookmark'
    end
  end

  def withdraw; end
end
