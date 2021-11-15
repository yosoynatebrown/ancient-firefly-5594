FactoryBot.define do
  factory :player do
    team
    name { Faker::Name.unique.name }
    age { Faker::Number.number(digits: 2) }
  end
end