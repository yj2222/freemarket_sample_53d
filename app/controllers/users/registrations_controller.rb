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

  def complete
    render "users/registrations/complete"
  end

  def create
    @user = User.create(user_params)
    if @user.save
      sign_in(@user)
      redirect_to root_path
    else
      render "users/registrations/information"
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
