class FacilitiesController < ApplicationController
  # 詳細表示
  def show
    @facility = Facility.includes(:facility_images).find(params[:id])
  end

  # 一覧表示
  def index
    if request.fullpath.include?("gourmet") == true
      @facility_type = "gourmet"
    else
      @facility_type = "spot"
    end

    @facilities = Facility.includes(:facility_images).where(type: @facility_type).page(params[:page])
  end


  def bookmark
    # has many throughのりレーションを組んだことで　current_user.bookmark_facilitiesで呼
    @spots = current_user.bookmark_facilities.includes(:user).where(type: "spot").page(params[:page])
    @gourmets = current_user.bookmark_facilities.includes(:user).where(type: "gourmet").page(params[:page])

    # もっとみるボタンの非同期処理　場合わけ（施設とグルメ）
    # 同じページに二つの「もっとみるボタン」があるため、場合わけが必要
    return unless request.xhr?
    case params[:type]
    when "bookmark_spot", "bookmark_gourmet"
      @bookmark_type = params[:type]
      # render params[:type].to_s
    end
  end
end
