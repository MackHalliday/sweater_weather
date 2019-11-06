class RoadTripFacade
  def initialize(road_trip_params)
    @origin = location_info(road_trip_params[:origin])
    @destination =  location_info(road_trip_params[:destination])
    @api_key = road_trip_params[:api_key]
  end

  def geocode_data(location)
    GoogleService.new.get_geocode_data(location)
  end

  def location_info(location)
    Location.new(geocode_data(location))
  end

  def directions
    @directions ||= GoogleService.new.get_directions(@origin.formatted_address, @destination.formatted_address)
  end

  def direction_info
    Route.new(@origin, @destination, directions)
  end

  def dark_sky_forecasted_data
    @dark_sky_data ||= DarkSkyService.new.get_forecasted_weather(@destination.latitude, @destination.location_info.longitude, direction_info.arrival_time)
  end

  def arrival_forecast
    ArrivalForecast.new(dark_sky_forcasted_data)
  end

  def data
    RoadTripData.new(direction_info, arrival_forecast)
  end
end
