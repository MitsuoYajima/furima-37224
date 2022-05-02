class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :prefecture_id, :municipality, :address, :building_name, :phone_number, :order_id, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "Input Correctly"}
    validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank" } 
    validates :municipality
    validates :address
    validates :phone_number, format: {with: /\A0\d{9,10}\Z/, only_integer: true, message: "Input only number" }
    validates :token
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id,)
    shipping_address = ShippingAddress.create(post_code: post_code, prefecture_id: prefecture_id, municipality: municipality, address: address, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end

end