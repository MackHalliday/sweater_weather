class RoadTripData
  attr_reader :route, :arrival_forecast

  def initialize(route_info, arrival_forecast)
    @route = route_info
    @arrival_forecast = arrival_forecast
  end
end
