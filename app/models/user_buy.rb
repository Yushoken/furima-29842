class UserBuy
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :addresses, :building, :phone_number, :token, :item_id, :user_id

  with_options presence: true do
    validates :token
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: "Input correctly"}
    validates :city
    validates :addresses
    validates :phone_number, format: { with: /0[89]0\d{8}/, message: "Input only number"}
  end
  validates :prefecture_id, numericality: { other_than: 1, message: "Select" }
 
  def save
  #binding.pry
    buy = Buy.create(item_id: item_id, user_id: user_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, addresses: addresses, building: building, phone_number: phone_number ,buy_id: buy.id)
  end
end