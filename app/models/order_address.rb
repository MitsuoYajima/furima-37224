class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :prefecture_id, :municipality, :address, :building_name, :phone_number, :token

  with_options presence: true do
    validates :token
    validates :user_id
    validates :item_id
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "Input Correctly"}
    validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank" } 
    validates :municipality
    validates :address
  end

    validates :phone_number, presence: true, length:{ minimum: 10,message:'is too short'}
    validates :phone_number, length:{ maximum: 11,message:'is too long'}
    validates :phone_number, format: {with: /\A[0-9]+\z/, message: "Input only number" }

  def save
    order = Order.create(user_id: user_id, item_id: item_id,)
    shipping_address = ShippingAddress.create(post_code: post_code, prefecture_id: prefecture_id, municipality: municipality, address: address, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end

end