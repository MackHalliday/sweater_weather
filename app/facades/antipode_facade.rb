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

  def start_city_latitude
    start_city_location_info.latitude
  end

  def start_city_longitude
    start_city_location_info.longitude
  end

  def find_antipode_city
    AntipodeService.new.get_antipode(start_city_latitude, start_city_longitude)
  end

  def find_location_by_lat_long
    latitude = find_antipode_city[:data][:attributes][:lat]
    longitude = find_antipode_city[:data][:attributes][:long]

    GoogleGeocodeService.new.reverse_geocode(latitude, longitude)
  end

  def antipode_geocode_data
    address = find_location_by_lat_long[:results][0][:formatted_address]
    GoogleGeocodeService.new.get_geocode_data(address)
  end

  def antipode_location_info
    Location.new(antipode_geocode_data)
  end

  def antipode_dark_sky_data
    DarkSkyService.new.get_weather(antipode_location_info.latitude, antipode_location_info.longitude)
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
    [{
      id: find_antipode_city[:data][:id],
      type: find_antipode_city[:data][:type],
      attributes: antipode_attributes,
      search_location: start_city_location_info.formatted_address
    }]
  end
end
