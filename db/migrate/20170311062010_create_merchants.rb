class CreateMerchants < ActiveRecord::Migration
  def change
    create_table :merchants do |t|
      t.string :name
      t.text :description
      t.attachment :image
      t.boolean :published
      t.timestamps
    end
  end
end
