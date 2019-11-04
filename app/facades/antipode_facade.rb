class AntipodeFacade
  def initialize(location)
    @start_city = location
  end

  def start_city_geocode_data
    GoogleGeocodeService.new.get_geocode_data(@location)
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

  def antipode_attributes
    {attributes: {
                    location_name: "Antipode City Name",
                      forecast: {
                        summary: "Mostly Cloudy",
                        current_temperature: "72",
                                    },
                search_location: "Hong Kong"
                }
            }
        ]
    }
  end
end
