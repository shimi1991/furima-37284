FactoryBot.define do
  factory :purchase_address do
    user_id { FactoryBot.create(:user) }
    item_id { FactoryBot.create(:item) }
    post_code      { Faker::Number.decimal_part(digits: 3) + '-' + Faker::Number.decimal_part(digits: 4) }
    prefectures_id { Faker::Number.between(from: 2, to: 48) }
    municipalities { Faker::Address.city }
    address        { Faker::Address.street_address }
    building_name  { Faker::Address.street_address }
    phone_number   { Faker::Number.decimal_part(digits: 11) }
    token          { Faker::Internet.password(min_length: 20, max_length: 30) }
  end
end
