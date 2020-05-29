class BookmarksController < ApplicationController
  def create
    bookmark = current_user.bookmarks.build(facility_id: params[:facility_id])
    bookmark.save!
    redirect_to facilities_path, success: t('.flash.bookmark')
  end

  def destroy
    current_user.bookmarks.find_by(facility_id: params[:facility_id]).destroy!
    redirect_to facilities_path, success: t('.flash.not_bookmark')
  end
end
