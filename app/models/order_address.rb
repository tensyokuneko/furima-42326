# app/models/order_address.rb

class OrderAddress
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :city, :address, :building, :phone_number,
                :user_id, :item_id, :token

  # バリデーションはあとで追記します

  def save
    # 各テーブルにデータを保存する処理はあとで書きます
  end
end
