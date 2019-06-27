class UsersController < ApplicationController
  def index
    render "users/new_registration"
  end

  def new
    render "users/registrations/information"
  end
end
