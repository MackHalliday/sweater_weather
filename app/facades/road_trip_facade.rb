class RoadTripFacade
  def initialize(road_trip_params)
    @origin = road_trip_params[:origin]
    @destination =  road_trip_params[:destination]
    @api_key = road_trip_params[:api_key]
  end

  def geocode_data
    @geocode_data ||= GoogleGeocodeService.new.get_geocode_data(@destination)
  end

  def location_info
    @location_info ||= Location.new(geocode_data)
  end

  def directions
    @directions ||= GoogleDirectionsService.new.get_directions(@origin, @destination )
  end

  def direction_info
    Route.new(@origin, @destination, directions)
  end

  def dark_sky_forecasted_data
    #https://api.darksky.net/forecast/[key]/[latitude],[longitude],[time]
    @dark_sky_data ||= DarkSkyService.new.get_forecasted_weather(location_info.latitude, location_info.longitude, direction_info.arrival_time)
  end

  def arrival_forecast
    ArrivalForecast.new(dark_sky_forcasted_data)
    #summary, #temperature
  end

  def trip
    direct_information
    #origin, destination, distance, :estimated_arrival
  end

  def data
    direct_information
    #calls all methods needed to create JSON hash
  end
end
