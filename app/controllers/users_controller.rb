class UsersController < ApplicationController
  def index
    render "users/login"
  end

  def new
    render "users/registrations/information"
  end
end
