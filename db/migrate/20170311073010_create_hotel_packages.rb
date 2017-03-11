class CreateHotelPackages < ActiveRecord::Migration
  def change
    create_table :hotel_packages do |t|
      t.string :hotel_id
      t.references :package
      t.timestamps
    end
    add_index :hotel_packages, :hotel_id
    add_index :hotel_packages, :package_id
  end
end
