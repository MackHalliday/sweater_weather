class Api::V1::RoadTripController < ApplicationController

  def show
    user = User.find_by(token: params[:api_key])
    if user.present?
      facade = RoadTripFacade.new(road_trip_params)
      render json: RoadTripSerializer.new(facade)
    else
      render json: {error: "Invalid request."}, status: 401
    end
  end

  private
  def road_trip_params
    params.permit(:api_key, :origin, :destination)
  end
end
