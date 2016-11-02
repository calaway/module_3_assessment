Fabricator(:item) do
  name        { Faker::Commerce.product_name }
  description { Faker::Lorem.paragraph }
  image_url   { "http://robohash.org/1.png?set=set2&bgset=bg1&size=200x200"}
end
