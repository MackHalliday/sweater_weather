class ForecastFacade
  def initialize(location)
    @location = location
  end

  def geocode_data
    @geocode_date ||= GoogleGeocodeService.new.get_geocode_data(@location)
  end

  def location_info
    @location_info ||= Location.new(geocode_data)
  end

  def dark_sky_data
    @dark_sky_data ||= DarkSkyService.new.get_weather(location_info.latitude, location_info.longitude)
  end

  def current_data
    dark_sky_data[:currently]
  end

  def daily_data

    dark_sky_data[:daily][:data]
  end

  def current_weather
    @current_weather ||= CurrentWeather.new(current_data)
  end

  def daily_weather

    daily_data.map.each_with_index do |data, index|
      DailyWeather.new(data, index + 1)
    end
  end

  def summary
    @summary ||= Summary.new(dark_sky_data)
  end

  def data
    ForecastData.new(summary, location_info, current_weather, daily_weather)
  end
end
