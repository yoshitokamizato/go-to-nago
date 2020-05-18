class FacilitiesController < ApplicationController

  def index
  end

  def show
    @facilities = Facility.all
    @facility_images = FacilityImage.all
    @menu = Menu.all

    puts"ここ："
    p @facility_images
  end

end
