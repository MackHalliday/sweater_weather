class ForecastData
  attr_reader :summary, :location_info, :current_weather, :daily_weather, :hourly_weather

  def initialize(summary, location_info, current_weather, hourly_weather, daily_weather)
    @summary = summary
    @location = location_info
    @current_weather = current_weather
    @hourly_weather = hourly_weather
    @daily_weather = daily_weather
  end
end
