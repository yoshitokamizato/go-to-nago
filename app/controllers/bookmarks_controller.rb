class BookmarksController < ApplicationController
  before_action :set_facility, only: %i[create destroy]
  def create
    bookmark = current_user.bookmarks.build(facility_id: params[:facility_id])
    bookmark.save!
  end

  def destroy
    current_user.bookmarks.find_by(facility_id: params[:facility_id]).destroy!
  end
  private
  def set_facility
    @facility = Facility.find(params[:facility_id])
  end
end
