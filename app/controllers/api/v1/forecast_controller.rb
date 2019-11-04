class Api::V1::ForecastController < ApplicationController
  def show
    render json: LocalWeatherSerializer.new(location_params)
  end

  def location_params
    params.permit(:location)
  end
end
