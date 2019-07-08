class TradesController < ApplicationController

  require 'payjp'

  def index
    # TODO:マージ後にユーザー登録機能で追加されたユーザーidを持ってくる記述に変更
    @current_user = User.find(1)
    # TODO:マージ後に@currentをcurrentに変更
    card = @current_user.credit
    if card.blank?
      redirect_to controller: 'credits', action: 'index'
      flash[:alert] = '購入にはクレジットカード登録が必要です'
    else
      Payjp.api_key= Rails.application.credentials.payjp[:PAYJP_PRIVATE_KEY]
      customer = Payjp::Customer.retrieve(card.customer_id)
      @default_card_information = customer.cards.retrieve(card.card_id)
    end
  end

  def buy
    Payjp.api_key= Rails.application.credentials.payjp[:PAYJP_PRIVATE_KEY]
    # TODO:マージ後にユーザー登録機能で追加されたユーザーidを持ってくる記述に変更
    @current_user = User.find(1)
    # TODO:マージ後に@currentをcurrentに変更
    card = @current_user.credit
    # TODO:マージ後に出品機能で追加されたプロダクトidを持ってくる記述を追加、下のコメントアウトを反映
    @product = Product.find(3)
    # @product = Product.find(params[:product_id])
    if card.blank?
      redirect_to controller: 'credits', action: 'index'
      flash[:alert] = '購入にはクレジットカード登録が必要です'
    else
      Payjp::Charge.create(
          amount: @product.price,
          customer: card.customer_id,
          currency: 'jpy',
      )
      @trade = Trade.new(buyer_id: @current_user.id, product_id: @product.id, flug: 1, seller_id: @product.user.id)
      if @trade.save
        flash[:notice] = '購入しました'
        redirect_to action: 'done'
      else
        flash[:alert] = '購入に失敗しました'
        redirect_to controller: "products", action: 'index'
      end
    end
  end

  def done
  end

  # private

  # def product_params
  #   params.require(:product).permit(:name,
  #     :description,
  #     :delivery_price,
  #     :prefecture,
  #     :delively_days,
  #     :price,
  #     :category_id,
  #     :condition).merge(user_id: 1, size: 1, delivery_type: 1)
  # end

  # def integer_string?(str)
  #   Integer(str)
  #   true
  # rescue ArgumentError
  #   false
  # end

  # def params_int(product_params)
  #   product_params.each do |key,value|
  #     if integer_string?(value)
  #       product_params[key]=value.to_i
  #     end
  #   end
  # end
  
end