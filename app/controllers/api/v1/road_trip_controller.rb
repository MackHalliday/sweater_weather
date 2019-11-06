class Api::V1::RoadTripController < ApplicationController

  def show
    user = User.find_by(token: params[:api_key])
    if user.present?
      facade = RoadTripFacade.new(params[:road_trip])
      render json: RoadTripSerializer.new(facade)
    else
      render json: {error: "Invalid request."}, status: 401
    end
  end
end
