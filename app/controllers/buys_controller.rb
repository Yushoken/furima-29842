class BuysController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create, :pay_item]

  def index
    return redirect_to :root 
    if user_signed_in? != current_user.id 
    @user_buy = UserBuy.new
    end
  end

  def new
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
  Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
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