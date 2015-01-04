Fabricator(:event) do
  end_time { Faker::Time.between(1.days.from_now, 4.days.from_now) }
  shop
  owner(fabricator: :user)
end
