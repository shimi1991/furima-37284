FactoryBot.define do
  factory :item do
    item_name          {"test"}
    explanation        {"テスト"}
    status_id          {2}
    delivery_charge_id {2}
    prefectures_id     {2}
    days_id            {2}
    category_id        {2}
    price              {5000}

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'),filename: 'test_image.png')
    end
  end
end
