class FacilitiesController < ApplicationController

  def index
  end

  def show_facility
    @facilities = Facility.includes(:facility_images).where(type:"facilities")
  end
  def show_gourmet
    @gourmets = Facility.includes(:facility_images).where(type:"gourmet")
  end

end
