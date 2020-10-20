class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  belongs_to_active_hash :category
  belongs_to_active_hash :sales_status
  belongs_to_active_hash :shopping_fee_status
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :scheduled_delivery
  has_one_attached :image

  with_options presence: true do
    validates :name
    validates :price, inclusion: { in: 300..9_999_999 }, format: { with: /\A[0-9]+\z/, message: 'Price is not included in the list' }
    validates :text
    validates :category_id,             numericality: { other_than: 0 }
    validates :sales_status_id,         numericality: { other_than: 0 }
    validates :shopping_fee_status_id,  numericality: { other_than: 0 }
    validates :prefecture_id,           numericality: { other_than: 0 }
    validates :scheduled_delivery_id,   numericality: { other_than: 0 }
    validates :image
  end
end
