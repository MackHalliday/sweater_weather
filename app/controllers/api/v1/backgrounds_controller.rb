class Api::V1::BackgroundsController < ApplicationController
  def show
    facade = BackgroundsFacade.new(location_params)
    render json: BackgroundsSerializer.new(facade)
  end

  private
  def location_params
    params["location"]
  end
end
