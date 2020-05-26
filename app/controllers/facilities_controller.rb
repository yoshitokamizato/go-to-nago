class FacilitiesController < ApplicationController

  def index
    @facilities = Facility.includes(:facility_images).where(type:"facilities")
    @gourmets = Facility.includes(:facility_images).where(type:"gourmet")
    # @facilities = Facility.all.includes(:user)
  end

  def show_facility
    @facilities = Facility.includes(:facility_images).where(type:"facilities")
  end

  def details
  end

  def show_gourmet
    @gourmets = Facility.includes(:facility_images).where(type:"gourmet")
  end

  def bookmark
    # has many throughのりレーションを組んだことで　current_user.bookmark_facilitiesで呼
    @facilities = current_user.bookmark_facilities.includes(:user).where(type:"facilities")
    @gourmets = current_user.bookmark_facilities.includes(:user).where(type:"gourmet")
  end


end
