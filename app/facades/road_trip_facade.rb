class RoadTripFacade
  def initialize(road_trip_params)
    @origin = road_trip_params[:origin]
    @destination =  road_trip_params[:destination]
    @api_key = road_trip_params[:api_key]
  end

  def geocode_data
    @geocode_data ||= GoogleGeocodeService.new.get_geocode_data(@location)
  end

  def location_info
    @location_info ||= Location.new(geocode_data)
  end

  def arrival_forecast
    #summary, #temperature
  end

  def trip
    #origin, destination, distance, :estimated_arrival
  end

  def data
    #calls all methods needed to create JSON hash
  end
end
