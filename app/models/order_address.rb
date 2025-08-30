# app/models/order_address.rb

class OrderAddress
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :city, :address, :building, :phone_number,
                :user_id, :item_id, :token

  # バリデーションはあとで追記します

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(
      order_id: order.id,
      postal_code: post_code,
      prefecture_id: prefecture_id,
      city: city,
      street: address,
      building: building,
      phone_number: phone_number
    )
  end
end
