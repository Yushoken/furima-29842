require 'rails_helper'

RSpec.describe UserBuy, type: :model do
  before do
    @user_buy = FactoryBot.build(:user_buy)
  end

  describe '購入機能' do
    context '情報登録がうまくいくとき' do
      it 'token,postal_code,city,addresses,phon_number,prefecture_idがあれば保存できること' do
        expect(@user_buy).to be_valid
      end
      it 'buildingが空でも保存できること' do
        @user_buy.building = nil
        expect(@user_buy).to be_valid
      end
    end

    context '情報登録がうまくいかないとき' do
      it 'tokenが空では登録できないこと' do
        @user_buy.token = nil
        @user_buy.valid?
        expect(@user_buy.errors.full_messages).to include("Token can't be blank")
      end
      it 'postal_codeが空では登録できないこと' do
        @user_buy.postal_code = nil
        @user_buy.valid?
        expect(@user_buy.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeがハイフンがないと登録できないこと' do
        @user_buy.postal_code = nil
        @user_buy.valid?
        expect(@user_buy.errors.full_messages).to include('Postal code Input correctly')
      end
      it 'cityが空では登録できないこと' do
        @user_buy.city = nil
        @user_buy.valid?
        expect(@user_buy.errors.full_messages).to include("City can't be blank")
      end
      it 'addressesが空では登録できないこと' do
        @user_buy.addresses = nil
        @user_buy.valid?
        expect(@user_buy.errors.full_messages).to include("Addresses can't be blank")
      end
      it 'phone_numberが空では登録できないこと' do
        @user_buy.phone_number = nil
        @user_buy.valid?
        expect(@user_buy.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberがハイフンなしの11桁以内でないと登録できないこと' do
        @user_buy.phone_number = nil
        @user_buy.valid?
        expect(@user_buy.errors.full_messages).to include('Phone number Input only number')
      end
      it 'prefecture_idが空では登録できないこと' do
        @user_buy.prefecture_id = nil
        @user_buy.valid?
        expect(@user_buy.errors.full_messages).to include('Prefecture Select')
      end
    end
  end
end
