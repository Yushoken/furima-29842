class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  before_action :set_item, only: [:edit, :show, :update]
  def index
    #@nickname = current_user.nickname
    # 2全ての商品のレコードをインスタンス変数に代入

    @item = Item.includes(:user).order("created_at DESC")
  end

  def new
    # １インスタンス変数を定義
    @item = Item.new
  end

  def create
    # 3商品が保存できた時とできなかった時で条件分岐が必要
    @item = Item.new(item_params)
    if @item.valid?
      @item.save
      redirect_to :root
    else
      render 'new'
    end
  end

  def update
    if @item.update(item_params)
      redirect_to :item
    else
      render :edit
    end
  end

  private
  def item_params
    params.require(:item).permit(:name, :info, :price, :sales_status_id, :shipping_fee_status_id, :prefecture_id, :scheduled_delivery_id, :category_id, :content, :image).merge(user_id: current_user.id)
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
