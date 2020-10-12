require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('public/images/test_image.png')
  end

  describe '商品情報入力' do
    context '商品情報登録がうまくいくとき' do
      it '画像、商品名、商品の説明、カテゴリ、商品の状態、配送料の負担、発送元の地域、発送までの日数、販売価格必須' do
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
      it 'カテゴリが１だと登録できない' do
        @item.category_id = '１'
        @item.valid?
        expect(@item.errors.full_messages).to include("Category Select")
      end
      it '商品の状態が空だと登録できない' do
        @item.sales_status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Sales status can't be blank")
      end
      it '商品の状態が１だと登録できない' do
        @item.sales_status_id =  1
        @item.valid?
        expect(@item.errors.full_messages).to include("Sales status Select")
      end
      it '配送料の負担が空だと登録できない' do
        @item.shipping_fee_status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fee status can't be blank")
      end
      it '配送料の負担が１だと登録できない' do
        @item.shipping_fee_status_id =  1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fee status Select")
      end
      it '発送元の地域が空だと登録できない' do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '発送元の地域が１だと登録できない' do
        @item.prefecture_id =  1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture Select")
      end
      it '発送までの日数が空だと登録できない' do
        @item.scheduled_delivery_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Scheduled delivery can't be blank")
      end
      it '発送までの日数が１だと登録できない' do
        @item.scheduled_delivery_id =  1
        @item.valid?
        expect(@item.errors.full_messages).to include("Scheduled delivery Select")
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
      it '販売価格が¥300以上でないと登録できない' do
        @item.price = 229
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it '販売価格が¥9,999,999以下でないと登録できない' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
    end
  end
end

    
    