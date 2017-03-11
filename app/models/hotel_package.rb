class HotelPackage < ActiveRecord::Base
  belongs_to :package

  validates :hotel_id, presence: true
  validates :package_id, presence: true
  validates :priority, presence: true, numericality: { greater_than_or_equal_to: 0 }

end
