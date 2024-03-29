FactoryBot.define do
  factory :item do
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
    title              {'test'}
    explanation        {'test'}
    category_id        {'2'}
    condition_id       {'2'}
    delivery_charge_id {'2'}
    prefecture_id      {'2'}
    days_to_ship_id    {'2'}
    price              {'1000'}
  end
end