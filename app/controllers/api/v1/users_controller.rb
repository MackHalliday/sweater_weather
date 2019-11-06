class Api::V1::UsersController < ApplicationController

  def create
    user = User.create(user_params)
    if user.save
      render json: {api_key: user.token}, status: 201
    else
      render json: {error: user.errors.full_messages.to_sentence}, status: 400
    end
  end

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
end
