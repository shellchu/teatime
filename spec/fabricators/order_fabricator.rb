Fabricator(:order) do
  hot { [true, false].sample }
  ice { |attrs| attrs[:hot] ? nil : ["0%", "30%", "50%", "70%", "100%"].sample }
  sugar { ["0%", "30%", "50%", "70%", "100%"].sample }
  beverage
  event
end
