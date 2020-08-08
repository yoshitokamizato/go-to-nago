class UsersController < ApplicationController
  before_action :authenticate_user!, :temporary_user

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

  def withdraw
  end

  private

  def temporary_user
    # 仮登録の場合、マイページに遷移しない
    if current_user.status = 0
        flash[:danger] = "仮登録のアカウントです。本登録を完了させてください。"
        redirect_to :users_regist
    end
  end
end
