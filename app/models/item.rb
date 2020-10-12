class Item < ApplicationRecord
  belongs_to :user
  has_one :buy
  has_one_attached :image


  
  
  with_options presence: true do
    validates :image
    validates :name
    validates :info
    validates :user
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
    validates :category_id, numericality: { other_than: 1, message: "Select" }
    validates :sales_status_id, numericality: { other_than: 1, message: "Select" }
    validates :shipping_fee_status_id, numericality: { other_than: 1, message: "Select" }
    validates :prefecture_id, numericality: { other_than: 1, message: "Select" }
    validates :scheduled_delivery_id, numericality: { other_than: 1, message: "Select" }
  end

end