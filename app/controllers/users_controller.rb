class UsersController < ApplicationController
  def index
    # render "users/login"
    render "users/new_registration"
  end

  def new
    # render "users/registrations/information" 
    render "users/new_registration_address"
  end
end
