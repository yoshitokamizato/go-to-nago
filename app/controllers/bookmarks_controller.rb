class BookmarksController < ApplicationController
  before_action :set_facility, only: %i[create destroy]
  def create
    bookmark = current_user.bookmarks.build(facility_id: params[:facility_id])
    bookmark.save!

    # 詳細画面の1つ目の言い値ボタンは他のと仕様が違うため
    # flagで識別して、同じajaxの中でも別のコマンドが必要
    return unless request.xhr?

    @flag = params["flag"] unless params["flag"].blank?
  end

  def destroy
    current_user.bookmarks.find_by(facility_id: params[:facility_id]).destroy!

    # 詳細画面の1つ目の言い値ボタンは他のと仕様が違うため
    # flagで識別して、同じajaxの中でも別のコマンドが必要
    return unless request.xhr?

    @flag = params["flag"] unless params["flag"].blank?
  end

  private

  def set_facility
    @facility = Facility.find(params[:facility_id])
  end
end
