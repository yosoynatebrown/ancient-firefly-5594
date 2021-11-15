FactoryBot.define do
  factory :competition do
    name { Faker::Sports::Football.competition }
    location { Faker::Address.city }
    sport { Faker::Team.sport.titleize }
  end
end
