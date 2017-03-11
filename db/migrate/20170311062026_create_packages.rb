class CreatePackages < ActiveRecord::Migration
  def change
    create_table :packages do |t|
      t.string :name
      t.text :description
      t.decimal :original_price
      t.decimal :discounted_price
      t.attachment :image
      t.boolean :published
      t.references :merchant
      t.timestamps
    end
    add_index :packages, :merchant_id
  end
end
