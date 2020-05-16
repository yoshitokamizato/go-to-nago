class FacilitiesController < ApplicationController
  def index
  end
  def show
    @facilities = Facility.all
  end
end
