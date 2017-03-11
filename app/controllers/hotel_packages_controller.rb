class HotelPackagesController < ApplicationController

  def show
    @hotel_packages = HotelPackage.where(hotel_id: params[:id]).order(priority: :desc)
  end

  def search
    @hotel_packages = {}
    unless params[:ids].blank?
      params[:ids].each do|id|
        hotel_package = HotelPackage.where(hotel_id: id).order(priority: :desc).first
        @hotel_packages[id] = hotel_package if hotel_package
      end
    end
  end

end
