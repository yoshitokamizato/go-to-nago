class FacilitiesController < ApplicationController

  def index
    @facilities = Facility.includes(:facility_images).where(type:"facilities")
    @gourmets = Facility.includes(:facility_images).where(type:"gourmet")
  end

  def show_facility
    @facilities = Facility.includes(:facility_images).where(type:"facilities")
  end

  def details
    # @facilities = Facility.find(params[:id])
  
  end

  def show_gourmet
    @gourmets = Facility.includes(:facility_images).where(type:"gourmet")
  end
  private
  # def details_params
  #   params.require(:facility).permit(:name,
  #                                     :postal_code,
  #                                     :type,
  #                                     :address,
  #                                     :running_time,
  #                                     :tel,
  #                                     :email,
  #                                     :description,
  #                                     :budget,
  #                                     :advice,
  #                                     :first_open,
  #                                     :last_open,
  #                                     :first_close,
  #                                     :last_close,
  #                                     :holiday,
  #                                     :parking,
  #                                     :owner_id,
  #                                     :home_page,
  #                                     :instagram,
  #                                     :twitter,
  #                                     :youtube,
  #                                     :status).merge(user_id: current_user.id)
  # end

end
