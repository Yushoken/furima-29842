require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('public/images/test_image.png')
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
      it '画像が空では保存できないこと' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名が空だと登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it '商品の説明が空だと登録できない' do
        @item.info = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Info can't be blank")
      end
      it 'カテゴリが空だと登録できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it '商品の状態が空だと登録できない' do
        @item.sales_status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Sales status can't be blank")
      end
      it '配送料の負担が空だと登録できない' do
        @item.shipping_fee_status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fee status can't be blank")
      end
      it '発送元の地域が空だと登録できない' do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '発送までの日数が空だと登録できない' do
        @item.scheduled_delivery_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Scheduled delivery can't be blank")
      end
      it '販売価格が空だと登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '販売価格が半角数字以外だと登録できない' do
        @item.price = '５５５５５'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it '販売価格が¥300~¥9,999,999の間でないと登録できない' do
        @item.price = '229'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
    end
  end
end

    
    