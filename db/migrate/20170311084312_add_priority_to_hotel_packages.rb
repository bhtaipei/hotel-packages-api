class AddPriorityToHotelPackages < ActiveRecord::Migration
  def change
    add_column :hotel_packages, :priority, :integer, default: 0
  end
end
