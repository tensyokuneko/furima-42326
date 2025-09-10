class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, :first_name, :last_name, :first_name_kana, :last_name_kana, :birth_date, presence: true

  FULL_WIDTH_REGEX = /\A[ぁ-んァ-ヶ一-龥々ー]+\z/
  validates :first_name,  format: { with: FULL_WIDTH_REGEX }
  validates :last_name,   format: { with: FULL_WIDTH_REGEX }

  
  KATAKANA_REGEX = /\A[ァ-ヶー]+\z/
  validates :first_name_kana, format: { with: KATAKANA_REGEX }
  validates :last_name_kana,  format: { with: KATAKANA_REGEX }

  
  validates :password, format: { with: /\A(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]+\z/ },
                       if: -> { password.present? }

  has_many :items, dependent: :destroy
  has_many :orders
end
