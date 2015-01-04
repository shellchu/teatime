Fabricator(:order) do
  event
  user
  hot { [true, false].sample }
  ice { |attrs| attrs[:hot] ? nil : ["0%", "30%", "50%", "70%", "100%"].sample }
  sugar { ["0%", "30%", "50%", "70%", "100%"].sample }
  beverage { |attrs| attrs[:event].shop.beverages.sample }
end
