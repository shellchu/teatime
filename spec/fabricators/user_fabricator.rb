Fabricator(:user) do
  email { Faker::Internet.free_email }
  password { Faker::Internet.password }
  password_confirmation { |attrs| attrs[:password] }
  full_name { Faker::Name.name }
end

Fabricator(:invalid_user, from: :user) do
  email nil
  password { Faker::Internet.password }
  full_name { Faker::Name.name }
end
