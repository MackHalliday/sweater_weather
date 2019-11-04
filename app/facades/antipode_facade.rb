class AntipodeFacade
  def initialize(location)
    @start_city = location
  end

  def start_city_geocode_data
    GoogleGeocodeService.new.get_geocode_data(@start_city)
  end

  def start_city_location_info
    Location.new(start_city_geocode_data)
  end

  def antipode_city_data
    AntipodeService.new.get_antipode(start_city_location_info.latitude, start_city_location_info.longitude)
  end

  def antipode_location_info
    Location.new(antipode_city_data)
  end

  def antipode_dark_sky_data
    DarkSkyService.new.get_weather(location_info.latitude, location_info.longitude)
  end

  def antipode_weather_current_data
    antipode_dark_sky_data[:currently]
  end

  def antipode_current_weather
    CurrentWeather.new(antipode_weather_current_data)
  end

  def antipode_forcast
    {
      summary: antipode_current_weather.summary,
      current_temperature: antipode_current_weather.temperature,
    }
  end

  def antipode_attributes
      {
        location_name: antipode_location_info.formatted_address,
        forecast: antipode_forcast
      }
  end

  def data
      {
        id: antipode_city_data[:id],
        type: antipode_city_data[:antipode],
        attributes: antipode_attributes,
        search_location: start_city_location_info.formated_address
      }
  end
end
