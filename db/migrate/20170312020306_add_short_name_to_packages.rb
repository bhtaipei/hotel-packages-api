class AddShortNameToPackages < ActiveRecord::Migration
  def change
    add_column :packages, :short_name, :string
  end
end
