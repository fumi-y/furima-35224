FactoryBot.define do
  factory :order_address do
    postal_code      { "333-4444"}
    prefecture       { Faker::Number.between(from: 1, to: 47) }
    municipality     { Faker::Address.city }
    street_number    { Faker::Address.street_name }
    building_name    { Faker::Address.building_number }
    telephone_number { Faker::Number.number(digits: 11).to_s }
    token            { "tok_abcdefghijk00000000000000000" }
  end
end
