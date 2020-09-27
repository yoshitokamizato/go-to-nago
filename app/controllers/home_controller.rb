class HomeController < ApplicationController
  def index
    @spots = Facility.includes(:facility_images).where(type: "spot")
    @gourmets = Facility.includes(:facility_images).where(type: "gourmet")
  end
end
