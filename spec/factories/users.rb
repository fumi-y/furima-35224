FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              { '2580aiu' }
    password_confirmation {password}
    last_name             { '空じょゥ' }
    first_name            { '承たロゥ' }
    last_name_kana        { 'クウジョゥ' }
    first_name_kana       { 'ジョゥタロォ' }
    birthday              { Faker::Date.birthday }
  end
end