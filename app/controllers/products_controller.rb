class ProductsController < ApplicationController
  def index  
    # カテゴリーの一覧
    @products_ladies = Product.where(categories_id: 1).order("created_at DESC").limit(4)
    @products_mens = Product.where(categories_id: 2).order("created_at DESC").limit(4)
    @products_kids = Product.where(categories_id: 3).order("created_at DESC").limit(4)
    @products_perfume = Product.where(categories_id: 4).order("created_at DESC").limit(4)
    # ブランドの一覧
    @products_chanel = Product.where(brand_id: 1).order("created_at DESC").limit(4) 
    @products_vuitton = Product.where(brand_id: 2).order("created_at DESC").limit(4)
    @products_supreme = Product.where(brand_id: 3).order("created_at DESC").limit(4)
    @products_nike = Product.where(brand_id: 4).order("created_at DESC").limit(4)
  end 

  def show 
    # NOTE：本番では以下の記述を使用する
    # @product = Product.find(params[:id])
    @product = Product.find(2)
  end

  def purchase
    @trade = Trade.new
  end
  
  def new
    @product = Product.new
    @image = Image.new
    @product.images.build
  
    # @category = Category.all
  end

  def create
    
    product = Product.new(params_int(product_params))
    if product.save
      Image.create(image_params)
      redirect_to root_path, notice: '出品しました。'
    else
      render :new
    end

  end

  private

  # ユーザID、SIZE、delivery_typeは未実装のため後ほど実装。

  def product_params
    params.require(:product).permit(:name,
      :description,
      :delivery_price,
      :prefecture,
      :delively_days,
      :price,
      :category_id,
      :condition).merge(user_id: 1, size: 1, delivery_type: 1)
  end

  def image_params
    last_id = Product.pluck(:id).last
    params.require(:product).require(:images_attributes).require("0").permit(:image_url).merge(product_id: last_id)
  end

  # ここに送られたパラメータを整数化する記述を記載。

  def integer_string?(str)
    Integer(str)
    true
  rescue ArgumentError
    false
  end

  private
  def product_params
    params.requre(:product)
  end

  def params_int(product_params)
    product_params.each do |key,value|
      if integer_string?(value)
        product_params[key]=value.to_i
      end
    end
  end
end
