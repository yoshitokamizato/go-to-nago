class MenusController < ApplicationController
  def index
    @menus = Facility.find(params["facility_id"]).menus
  end
end
