class Api::V1::UsersController < ApplicationController

  def create
    user = User.create!(user_params)
    # if user.save
    #   #returns auth token
    # else
    #   #returns request body with error
    # end
  end

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
end
