class ForecastSerializer
  def initialize(facade)
    @location = facade.location_info
    @summary = facade.summary
    @current_weather = facade.current_weather
    @daily_weather = facade.daily_weather
  end
end
