class CreditsController < ApplicationController

  def index
    @years = [2019,2020,2021,2022,2023,2024,2025,2026,2027,2028,2029,2030]
    @months = [1,2,3,4,5,6,7,8,9,10,11,12]
  end

  def new
    card = Credits.where(user_id: @current_user.id)
    redirect_to action: "show" if card.exists?
  end
    
  def create   # クレジットカード登録のメソッド
    # テスト鍵をセットする記述
    Payjp.api_key = 'sk_test_6be8842c8cbe2ba6e307b5b4'
    # paramsの中に'payjpToken'が存在するか確かめる
    if params['payjpToken'].blank?
      redirect_to action: "index"
    else
      # payjpに保存する記述
      @current_user = User.find(1)   # マージ後に消す(@currentを全てcurrentに変更する)
      customer = Payjp::Customer.create(
        card: params['payjpToken'],
        metadata: {user_id: @current_user.id}
      )
      # dbに保存する記述
      @card = Credit.new(user_id: @current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @card.save
        # redirect_to action: "show"
        redirect_to controller: 'products', action: 'index'
        flash[:notice] = 'クレジットカードの登録が完了しました'
      else
        redirect_to action: "create"
        flash[:alert] = 'クレジットカードの登録に失敗しました'
      end
    end
  end

  def show
    @current_user = User.find(1)   # マージ後に消す(@currentを全てcurrentに変更する)
    card = @current_user.credit
    if card.blank?
      redirect_to action: "index"
    else
      Payjp.api_key = "sk_test_6be8842c8cbe2ba6e307b5b4"
      customer = Payjp::Customer.retrieve(credit.customer_id)
      @customer_card = customer.cards.retrieve(credit.card_id)
    end
  end
  
end