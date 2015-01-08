# -*- encoding : utf-8 -*-
namespace :dev do

  desc "Rebuild system"
  task :build => ["tmp:clear", "log:clear", "db:drop", "db:create", "db:migrate", "db:seed" ]

  desc "demo"
  task :demo => :environment do
  end

  desc "fake data"
  task :fake => :environment do
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
  end
end
