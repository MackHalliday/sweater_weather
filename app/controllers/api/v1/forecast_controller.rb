class Api::V1::ForecastController< ApplicationController
  def show
    facade = ForecastFacade.new(location_params)
    render json: ForecastSerializer.new(facade)
  end

  private
  def location_params
    params["location"]
  end
end
