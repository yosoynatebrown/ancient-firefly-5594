FactoryBot.define do
  factory :player do
    team
    name { Faker::Sports::Football.player }
    age { Faker::Number.number(digits: 2) }
  end
end