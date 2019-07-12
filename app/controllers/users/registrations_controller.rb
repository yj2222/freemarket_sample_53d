class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_parameters

  def information
    @user = User.new
    render "users/registrations/information"
  end

  def tel_authentication
    @profile = Profile.new
    render "users/registrations/tel_authentication"
  end
  
  def address
    @area = Area.new
    @profile = Profile.new
    render "users/registrations/address"
  end

  def payment
    @credit = Credit.new
    @years = [2019,2020,2021,2022,2023,2024,2025,2026,2027,2028,2029,2030]
    @months = [1,2,3,4,5,6,7,8,9,10,11,12]
    render "users/registrations/payment"
  end

  def create_payment   # クレジットカード登録のメソッド
    # テスト鍵をセットする記述
    Payjp.api_key = Rails.application.credentials.payjp[:PAYJP_PRIVATE_KEY]
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
        render "users/registrations/complete"
        flash[:notice] = 'クレジットカードの登録が完了しました'
      else
        redirect_to action: "create"
        flash[:alert] = 'クレジットカードの登録に失敗しました'
      end
    end
  end

  def complete
    render "users/registrations/complete"
  end

  def create
    @user = User.create(user_params)
    if @user.save
      sign_in(@user)
      redirect_to root_path
    else
      render "users/registrations/signup"
    end
  end

  def destroy
    super
    session[:keep_signed_out] = true
  end
  
  def all
    @user = User.new
    @area = Area.new
    @credit = Credit.new
    @address = Address.new
    @years = [2019,2020,2021,2022,2023,2024,2025,2026,2027,2028,2029,2030]
    @months = [1,2,3,4,5,6,7,8,9,10,11,12]
    render "users/registrations/all_registration"
  end

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname])
  end

  def user_params
    params.require(:user).permit(:nickname, :email, :password, 
      profile_attributes: [:id, :firstname_kanji, :lastname_kanji, :firstname_katakana, :lastname_katakana, :birth_year, :birth_month, :birth_day, :phone_number],   
      area_attributes: [:id, :post_number, :prefecture, :city, :address_number, :building])
  end
end
