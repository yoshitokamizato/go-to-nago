class FacilitiesController < ApplicationController

  def index
  end

  def show
    @facilities = Facility.all
    @facility_images = FacilityImage.all
    @menu = Menu.all
  end

end
