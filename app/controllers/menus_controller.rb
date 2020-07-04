class MenusController < ApplicationController
  def index
    # idがfacility_idのfacilityを呼び出し
    @facility = Facility.find(params["facility_id"])
    # @facilityに紐付いたmenuを全て呼び出す
    @menus = @facility.menus.page(params[:page])
    # @facilityのtypeを呼び出し
    # （施設（facility）か@gourmet（グルメ）かを調べるため）
    @facility_type = @facility.type
  end
end
