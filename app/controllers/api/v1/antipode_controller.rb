class Api::V1::AntipodeController < ApplicationController
  def show
    facade = AntipodeFacade.new(location_params)
    render json: AntipodeSerializer.new(facade)
  end

  private
  def location_params
    params["location"]
  end
end
