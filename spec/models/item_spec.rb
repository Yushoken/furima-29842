require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品情報入力' do
    context '商品情報登録がうまくいくとき' do
      it '画像必須' do
        expect(@item).to be_valid
      end
      it '商品名必須' do
        expect(@item).to be_valid
      end
      it '商品の説明必須' do
        expect(@item).to be_valid
      end
      it 'カテゴリ必須' do
        expect(@item).to be_valid
      end
      it '商品の状態必須' do
        expect(@item).to be_valid
      end
      it '配送料の負担必須' do
        expect(@item).to be_valid
      end
      it '発送元の地域必須' do
        expect(@item).to be_valid
      end
      it '発送までの日数必須' do
        expect(@item).to be_valid
      end
      it '販売価格必須' do
        expect(@item).to be_valid
      end
    end

    context '商品情報登録がうまくいかないとき' do
      it '画像が空だと登録できない' do
        @item.image = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名が空だと登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'カテゴリが空だと登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("can't be blank")
      end
      it '商品の状態が空だと登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("can't be blank")
      end
    end
  end
end

    
    