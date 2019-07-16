class MypagesController < ApplicationController
  def index
  end

  def edit
  end
  
  def show
  end

  def new
  end

  def create
  end

  def update
  end

  def destroy
  end

  def selled
    @user_product = Product.where(user_id: current_user.id)
  end
  
end
