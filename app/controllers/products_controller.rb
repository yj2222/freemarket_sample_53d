class ProductsController < ApplicationController
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
    # NOTE：本番では以下の記述を使用する
    # @product = Product.find(params[:id])
    @product = Product.find(1)
  end

  def purchase
    @product = Product.find(3)
  end
  
  def new
    @product = Product.new
    @image = Image.new
    @product.images.build
    # @category = Category.new
    # @product.category.build
    
  end

  def create
    Category.create(category_params)
    product = Product.new(params_int(product_params))
    if product.save
      
      num = 1
      while params[:images]["#{num}"].present? do
        Image.create(image_params(num))
        num += 1
      end

      redirect_to root_path, notice: '出品しました。'
    else
      render :new
    end
  end

  private

  # ユーザID、SIZE、delivery_typeは未実装のため後ほど実装。

  def product_params
    last_id = Category.pluck(:id).last
    params.require(:product).permit(
      :name,
      :description,
      :size,
      :condition,
      :delivery_price,
      :delivery_days,
      :prefecture,
      :price).merge(user_id: 1, delivery_type: 1, category_id: last_id)
  end

  def image_params(num)
      last_id = Product.pluck(:id).last
      params.require(:images).require("#{num}").permit(:image_url).merge(product_id: last_id)
  end

  def category_params
    params.require(:product).require(:category).permit(:parent)
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
