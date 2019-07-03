class ProductsController < ApplicationController
  def index  
    
  end 

  def show 
  end

  def new
    @product = Product.new
    @image = Image.new
    @product.images.build
  
    # @category = Category.all
  end

  def create
    
    product = Product.new(product_params)
    if product.save
      Image.create(image_params)
      redirect_to root_path, notice: '出品しました。'
    else
      render :new
    end


  end


  def upload
    
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

end
