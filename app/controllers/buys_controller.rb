class BuysController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create, :pay_item]

  def index
    # １ログインしてるユーザーと商品のuser_idが一致していたらrootpathに飛ばす
    # ２既に購入済みの商品に対して購入画面に飛ばないようにredirectさせる
    redirect_to :root if current_user.id == @item.user_id || @item.buy.present?
    @user_buy = UserBuy.new 
  end

  def create
    @user_buy = UserBuy.new(buy_params)
    if @user_buy.valid?
      pay_item
      @user_buy.save
      redirect_to controller: :items, action: :index
    else
      render action: :index
    end
  end

  private

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: buy_params[:token],
      currency: 'jpy'
    )
  end

  def buy_params
    params.require(:user_buy).permit(:postal_code, :prefecture_id, :city, :addresses, :building, :phone_number, :buy_id).merge(token: params[:token], item_id: params[:item_id], user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end
