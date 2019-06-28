class UsersController < ApplicationController
  def index
    # render "users/login"
    # render "users/new_registration"
    render "users/complete"
  end

  def new
    render "users/registrations/information"
  end
end
