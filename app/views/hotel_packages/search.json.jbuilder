@hotel_packages.each do |hotel_id, hotel_package|
  json.set! hotel_id do
    json.(hotel_package.package, :name, :description, :original_price, :discounted_price)
  end
end
