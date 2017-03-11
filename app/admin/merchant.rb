ActiveAdmin.register Merchant do

  permit_params :name, :description, :image, :published,
    packages_attributes: [:id, :name, :image, :description, :original_price, :discounted_price, :published, :merchant_id, :_destroy]

  filter :name, as: :string
  filter :published, as: :boolean

  index do
    selectable_column
    id_column
    column :name
    column :published
    column :created_at
    actions
  end

  show do |merchant|
    attributes_table do
      row :id
      row :image do
        image_tag(merchant.image_thumbnail_url, size: "100x100")
      end
      row :name
      row :description
      row :published
      row :created_at
      row :updated_at
    end
    panel "Packages" do
      table_for merchant.packages do
        column :name
        column do |package|
          image_tag(package.image_thumbnail_url, size: "100x100")
        end
        column :description
        column :original_price
        column :discounted_price
        column :published
      end
    end
    active_admin_comments
  end

  form do |f|
    f.inputs "Merchant Details" do
      f.input :name
      f.input :image, :as => :file
      f.input :description
      f.input :published
    end
    f.inputs "Packages" do
      f.has_many :packages, allow_destroy: true do |a|
        a.input :name
        a.input :image, :as => :file, :hint => a.template.image_tag(a.object.image.url(:thumbnail))
        a.input :description
        a.input :original_price
        a.input :discounted_price
        a.input :published
      end
    end
    f.actions
  end

end
# 