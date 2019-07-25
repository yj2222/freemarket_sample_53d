class ProductsController < ApplicationController
  before_action :set_product, only: [:edit,:show,:update,:purchase,:exhibit]
  before_action :check_signin, only: [:show,:purchase,:exhibit]

  def index  
    # カテゴリーの一覧 スコープを使用 models/product.rb参照
    @products_ladies = Product.where(category_id: 1..175).recent
    @products_mens = Product.where(category_id: 176..303).recent
    @products_kids = Product.where(category_id: 304..417).recent
    @products_perfume = Product.where(category_id: 698..706).recent
    # ブランドの一覧
    @products_chanel = Product.where(brand_id: 1).recent 
    @products_vuitton = Product.where(brand_id: 2).recent
    @products_supreme = Product.where(brand_id: 3).recent
    @products_nike = Product.where(brand_id: 4).recent 
    
    # スコープのメリットを記録するためにあえて残しています
    # @products_ladies = Product.where(categories_id: 1).order("created_at DESC").limit(4)
  end 

  def show
    @user_product = Product.where(user_id: @product.user.id)
    num = Product.pluck(:id)
    num.shuffle!
    while num.first == @product.id do
      num.shuffle!
    end
    @left_product = Product.find(num.first)
    num.shuffle!
    while num.first == @product.id do
      num.shuffle!
    end
    @right_product = Product.find(num.first)
    if current_user.id == @product.user.id
      redirect_to exhibit_product_path(@product.id)
    end
  end

  def purchase
    card = current_user.credit
    if card.blank?
      redirect_to action: "index"
    else
      Payjp.api_key = Rails.application.credentials.payjp[:PAYJP_PRIVATE_KEY]
      customer = Payjp::Customer.retrieve(card.customer_id)
      @customer_card = customer.cards.retrieve(card.card_id)
    end
  end
  
  def new
    @product = Product.new
    @image = Image.new
    @product.images.build
    @trade = Trade.new
  end

  def create
    @product = Product.new(params_int(product_params))
    if @product.save
      
      num = 0
      while params[:images]["#{num}"].present? do
        @image = Image.new(image_params(num))
        @image.save
        num += 1
      end

      last_id = Product.pluck(:id).last
      @trade = Trade.new(seller_id: current_user.id, product_id: last_id, flug: 1)
      @trade.save

      redirect_to root_path, notice: '出品しました。'
    else
      render :new
    end
  end

  def destroy
    @product = Product.destroy(params[:id])
    redirect_to root_path, notice: '削除に成功しました。'
    
  end
  def exhibit
    @user_product = Product.where(user_id: @product.user.id)
    num = Product.pluck(:id)
    num.shuffle!
    while num.first == @product.id do
      num.shuffle!
    end
    @left_product = Product.find(num.first)
    num.shuffle!
    while num.first == @product.id do
      num.shuffle!
    end
    @right_product = Product.find(num.first)
  end

  def edit
    @category = @product.category
    gon.category = @product.category
    @images = @product.images
    gon.images = @product.images
  end

  def update
    @product.update(product_params)

    @product.images.each do |image|
      image.destroy
    end
    
    num = 0
    while params[:images]["#{num}"].present? do
      @image = Image.new(update_image_params(num))
      @image.save
      num += 1
    end

  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(
      :name,
      :description,
      :category_id,
      :size,
      :brand_id,
      :condition,
      :delivery_price,
      :delivery_type,
      :delivery_days,
      :prefecture,
      :price).merge(user_id: current_user.id)
  end

  def image_params(num)
    last_id = Product.pluck(:id).last
    params.require(:images).require("#{num}").permit(:url).merge(product_id: last_id)
  end

  def update_image_params(num)
    product_id = @product.id
    params.require(:images).require("#{num}").permit(:url).merge(product_id: product_id)
  end

  # 送られたパラメータを整数化する。
  def integer_string?(str)
    Integer(str)
    true
  rescue ArgumentError
    false
  end

  def check_signin
    redirect_to root_path unless user_signed_in?
  end

  def params_int(product_params)
    product_params.each do |key,value|
      if integer_string?(value)
        product_params[key]=value.to_i
      end
    end
  end
end
