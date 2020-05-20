class FacilitiesController < ApplicationController

  def index
  end

  def show
    @facilities = Facility.includes(:facility_images)
    @menu = Menu.all
  end

end
