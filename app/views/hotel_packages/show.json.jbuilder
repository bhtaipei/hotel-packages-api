json.array!(@hotel_packages) do |hotel_package|
  json.(hotel_package.package, :name, :description, :original_price, :discounted_price, :image_url, :image_thumbnail_url)
  json.merchant(hotel_package.package.merchant, :name, :description, :image_url, :image_thumbnail_url)
end
