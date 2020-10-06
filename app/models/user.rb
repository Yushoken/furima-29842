class User < ApplicationRecord
  has_many :items
  has_many :buys

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

          #PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
          #validates_format_of :password, with: PASSWORD_REGEX, message: 'Include both letters and numbers', length: {minimum: 6}     
   validates :nickname, presence: true 
   validates :birth_date, presence: true
   with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: 'Full-width characters' } do
     validates :first_name
     validates :last_name
   end
   with_options presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: 'Full-width kata characters' } do
     validates :first_name_kana
     validates :last_name_kana
 end
  
  
end
