FactoryBot.define do
  factory :team do
    nickname { Faker::Team.name.titleize }
    hometown { Faker::Address.city }
  end
end