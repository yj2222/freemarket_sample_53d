class UsersController < ApplicationController
  def index
    # render "users/login"
    render "users/new_registration"
  end

  def new
    # render "users/registrations/information" 
    render "users/new_registration_address"
    # render "users/registrations/information"
    # render "users/registrations/tel_authentication"
    @years = [2019,2020,2021,2022,2023,2024,2025,2026,2027,2028,2029,2030]
    @months = [1,2,3,4,5,6,7,8,9,10,11,12]
    render "users/registrations/payment"
  end
end
