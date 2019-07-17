class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_parameters
  before_action :login_user_valid, only: :all

  def all
    @area = Area.new
    @address = Address.new
    data = session["devise.omniauth_data"]
    
    if data.present?
      @user = User.new(
        nickname: data["info"]["name"],
        email: data["info"]["email"],
        provider: data["provider"],
        uid: data["uid"]
      )
    else
      @user = User.new
    end
    render "users/registrations/all_registration"
    session.delete('devise.omniauth_data')
  end

  def payment
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
      customer = Payjp::Customer.create(
        card: params['payjpToken'],
        metadata: {user_id: current_user.id}
      )
      # dbに保存する記述
      @card = Credit.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
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
      redirect_to signup_payment_path
    else
      render "users/signup"
    end
  end

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname])
  end

  def login_user_valid
    if current_user
      redirect_to root_path
    end
  end

  def user_params
    params.require(:user).permit(:nickname, :email, :password, :provider, :uid,
      profile_attributes: [:id, :firstname_kanji, :lastname_kanji, :firstname_katakana, :lastname_katakana, :birth_year, :birth_month, :birth_day, :phone_number],   
      area_attributes: [:id, :post_number, :prefecture, :city, :address_number, :building])
  end
end
