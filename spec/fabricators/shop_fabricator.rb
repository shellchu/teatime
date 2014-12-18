Fabricator(:shop) do
  name { Faker::Name.name }
  description { Faker::Lorem.sentence }
  address { Faker::Address.street_address }
  phone { Faker::PhoneNumber.cell_phone }
end
