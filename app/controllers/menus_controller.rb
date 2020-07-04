class MenusController < ApplicationController
  def index
    @facility = Facility.find(params["facility_id"])
    @menus = @facility.menus.page(params[:page])
    @facility_type = @facility.type
  end
end
