class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  VALID_ZENKAKU_REGEX = /\A[ぁ-んァ-ン一-龥]/.freeze
  VALID_KATAKANA_REGEX = /\A[ァ-ヶー－]+\z/.freeze

  with_options presence: true do
    validates :nickname
    validates :last_name, format: { with: VALID_ZENKAKU_REGEX, message: 'is invalid. Input full-width characters.' }
    validates :first_name, format: { with: VALID_ZENKAKU_REGEX, message: 'is invalid. Input full-width characters.' }
    validates :last_name_kana, format: { with: VALID_KATAKANA_REGEX, message: 'is invalid. Input full-width katakana characters.' }
    validates :first_name_kana, format: { with: VALID_KATAKANA_REGEX, message: 'is invalid. Input full-width katakana characters.' }
    validates :birth_date
  end

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])/.freeze
  validates :password, format: { with: VALID_PASSWORD_REGEX, message: "include both half-width letters and numbers. Don't type full-width." }
end
