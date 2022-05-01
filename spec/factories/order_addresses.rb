FactoryBot.define do
  factory :order_address do

    post_code     {'123-4567'}
    prefecture_id {'2'}
    municipality  {'札幌市'}
    address       {'100'}
    building_name {'フリマビル100'}
    phone_number  {'09012345678'}
  end
end