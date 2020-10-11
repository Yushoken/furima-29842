class Item < ApplicationRecord
  belongs_to :user
  has_one :buy
  has_one_attached :image
  
  
  validates :sales_status_id, numericality: { other_than: 1 } 

end
