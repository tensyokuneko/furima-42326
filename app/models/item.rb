class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  has_one :order,class_name: "ItemOrder"
  has_one_attached :image

  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_fee
  belongs_to :prefecture
  belongs_to :shipping_days

  with_options presence: true do
    validates :image
    validates :name
    validates :description
    validates :price
  end

  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }

  validates :category_id, numericality: { other_than: 0 }
  validates :condition_id, numericality: { other_than: 0 }
  validates :shipping_fee_id, numericality: { other_than: 0 }
  validates :prefecture_id, numericality: { other_than: 0 }
  validates :shipping_days_id, numericality: { other_than: 0 }
end
