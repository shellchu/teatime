Fabricator(:beverage) do
  name { "#{Faker::Name.name} Tea" }
  description { Faker::Lorem.sentence }
  hot { [true, false].sample }
  cold { [true, false].sample }
  size { ["Large", "Medium", "Small"].sample }
  price { rand(3..10)*5 }
  shop
end
