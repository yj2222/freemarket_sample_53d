class ProductsController < ApplicationController
  before_action :set_product, only: [:edit,:show,:update,:purchase,:exhibit]

  def index  
    # カテゴリーの一覧 スコープを使用 model/product.rb参照
    @products_ladies = Product.where(category_id: 1).recent
    @products_mens = Product.where(category_id: 2).recent
    @products_kids = Product.where(category_id: 3).recent
    @products_perfume = Product.where(category_id: 4).recent
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
  end

  def purchase
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
      
      num = 1
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

  def exhibit
    @user_product = Product.where(user_id: @product.user.id)
    num = Product.count('id')
    @left_product = Product.find(rand(1..num))
    @right_product = Product.find(rand(1..num))
    # while @right_product == @left_product do
    #   @right_product = Product.find(rand(1..num))
    # end
  end

  def edit
    @images = @product.images
    @image = Image.new(url: @images.first.url, product_id: @product.id)
    @images.each do |image|
      image.destroy
    end
    @image.save
  end

  def update
    @product.update(product_params)

    @product.images.each do |image|
      image.destroy
    end
    
    num = 1
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

  def params_int(product_params)
    product_params.each do |key,value|
      if integer_string?(value)
        product_params[key]=value.to_i
      end
    end
  end
end
