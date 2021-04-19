FactoryBot.define do
  factory :item do
    name            { Faker::Name.name }
    description     { Faker::Lorem.sentence }
    condition_id    { Faker::Number.between(from: 1, to: 5) }
    postage_id      { Faker::Number.between(from: 1, to: 2) }
    area_id         { Faker::Number.between(from: 1, to: 47) }
    delivery_day_id { Faker::Number.between(from: 1, to: 3) }
    category_id     { Faker::Number.between(from: 1, to: 10) }
    price           { Faker::Number.between(from: 300, to: 9999999) }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('app/assets/images/kanitama.png'), filename: 'kanitama.png')
    end
  end
end
