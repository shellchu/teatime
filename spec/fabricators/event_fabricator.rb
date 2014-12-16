Fabricator(:event) do
  end_time { Faker::Time.between(2.days.ago, 2.days.from_now) }
end
