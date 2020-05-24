class FacilitiesController < ApplicationController

  def index
    @facilities = Facility.includes(:facility_images).where(type:"facilities")
    @gourmets = Facility.includes(:facility_images).where(type:"gourmet")
  end

  def show_facility
    @facilities = Facility.includes(:facility_images).where(type:"facilities")
  end

  def details
  end

  def show_gourmet
    @gourmets = Facility.includes(:facility_images).where(type:"gourmet")
  end


end
