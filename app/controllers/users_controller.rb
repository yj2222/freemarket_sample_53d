class UsersController < ApplicationController
  def index
    # render "users/login"
    render "users/new_registration"
  end

  def new
    # render "users/registrations/information"
    render "users/registrations/tel_authentication"
  end
end
