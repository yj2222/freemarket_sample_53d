class TradesController < ApplicationController

  require 'payjp'

  def index
    @current_user = User.find(1)   # マージ後に消す(@currentを全てcurrentに変更する)
    card = @current_user.credit
    if card.blank?
      redirect_to controller: 'credits', action: 'index'
      flash[:alert] = '購入にはクレジットカード登録が必要です'
    else
      Payjp.api_key= "sk_test_6be8842c8cbe2ba6e307b5b4"
      customer = Payjp::Customer.retrieve(card.customer_id)
      @default_card_information = customer.cards.retrieve(card.card_id)
    end
  end

  def buy
    @current_user = User.find(1)   # マージ後に消す(@currentを全てcurrentに変更する)
    card = @current_user.credit
    @product = Product.find(1)   # マージ後に消す記述
    # @product = Product.find(params[:product_id])
    Payjp::Charge.create(
        amount: @product.price,
        customer: card.customer_id,
        currency: 'jpy',
    )
    @trade = Trade.new(buyer_id: @current_user.id, products_id: @product.id, flug: '1', seller_id: )
    if @trade.save
      flash[:notice] = '購入しました'
      redirect_to action: 'done'
    else
      flash[:alert] = '購入に失敗しました'
      redirect_to controller: "products", action: 'index'
    end
  end

end
