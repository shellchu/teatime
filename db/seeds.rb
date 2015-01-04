# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create!(email: "orga@xxx.com", password: "1234", password_confirmation: "1234", full_name: "Orga")

shops = Fabricate.times(5, :shop)
beverages = Fabricate.times(100, :beverage) do
  shop shops.sample
end

events = Fabricate.times(5, :event) do
  shop shops.sample
end

orders = Fabricate.times(10, :order) do
  event events.sample
end
