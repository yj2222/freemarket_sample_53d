class TradesController < ApplicationController

  require 'payjp'

  def buy
    Payjp.api_key= Rails.application.credentials.payjp[:PAYJP_PRIVATE_KEY]
    card = current_user.credit
    @product = Product.find(params[:id])
    if card.blank?
      redirect_to controller: 'credits', action: 'index'
      flash[:alert] = '購入にはクレジットカード登録が必要です'
    else
      Payjp::Charge.create(
          amount: @product.price,
          customer: card.customer_id,
          currency: 'jpy',
      )
      @trade = Trade.new(buyer_id: current_user.id, product_id: @product.id, flug: 1, seller_id: @product.user.id)
      if @trade.save
        flash[:notice] = '購入しました'
        redirect_to "/trades/:trade_id/done"
      else
        flash[:alert] = '購入に失敗しました'
        redirect_to controller: "products", action: 'index'
      end
    end
  end

  def done
  end

  private

  def product_params
    params.require(:product).permit(
      :name,
      :description,
      :category_id,
      :size,
      :condition,
      :delivery_price,
      :delivery_type,
      :delivery_days,
      :prefecture,
      :price).merge(user_id: 1)
  end

  def image_params(num)
      last_id = Product.pluck(:id).last
      params.require(:images).require("#{num}").permit(:url).merge(product_id: last_id)
  end

  # 送られたパラメータを整数化する。
  def integer_string?(str)
    Integer(str)
    true
  rescue ArgumentError
    false
  end

  def params_int(product_params)
    product_params.each do |key,value|
      if integer_string?(value)
        product_params[key]=value.to_i
      end
    end
  end
  
end