# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
events = Fabricate.times(5, :event)
tomorrow_teatime = Fabricate(:event, end_time: 10.day.from_now)
order = Fabricate.times(10, :order) do
  event tomorrow_teatime
end
