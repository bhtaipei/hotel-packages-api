ActiveAdmin.register HotelPackage do

  permit_params :hotel_id, :package_id, :priority

  filter :hotel_id, as: :string
  filter :package_id, as: :string

  index do
    selectable_column
    id_column
    column :hotel_id
    column :package_id
    column :priority
    column :created_at
    actions
  end

  form do |f|
    f.inputs "Hotel Package Details" do
      f.input :hotel_id
      f.input :package_id
      f.input :priority
    end
    f.actions
  end

end
