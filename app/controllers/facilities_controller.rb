class FacilitiesController < ApplicationController

  def index
    @facilities = Facility.includes(:facility_images).where(type:"facilities")
    @gourmets = Facility.includes(:facility_images).where(type:"gourmet")
    # @facilities = Facility.all.includes(:user)
  end
  # 詳細表示
  def show
    @facility = Facility.includes(:facility_images).find(params[:id])
  end
  def show_facility
    @facilities = Facility.includes(:facility_images).where(type:"facilities").page(params[:page])
  end

  def show_gourmet
    @gourmets = Facility.includes(:facility_images).where(type:"gourmet").page(params[:page])
  end

  def bookmark
    # has many throughのりレーションを組んだことで　current_user.bookmark_facilitiesで呼
    @facilities = current_user.bookmark_facilities.includes(:user).where(type:"facilities").page(params[:page])
    @gourmets = current_user.bookmark_facilities.includes(:user).where(type:"gourmet").page(params[:page])
  end
end
