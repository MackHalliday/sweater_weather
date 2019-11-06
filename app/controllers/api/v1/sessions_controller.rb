class Api::V1::SessionsController<ApplicationController
  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      render json: {api_key: user.token}, status: 201
    else
      render json: {error: "Invalid email or password."}, status: 400
    end
  end
end
