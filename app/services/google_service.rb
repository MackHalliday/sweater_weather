class GoogleService

  def get_geocode_data(location)
    json_response = conn.get('/maps/api/geocode/json') do |request|
      request.params['address'] = location
      request.params['key'] = ENV['google_geocode']
    end
    parsed_data = JSON.parse(json_response.body, symbolize_names: true)
  end

  def get_timezone(current_time, location)
    json_response = conn.get('/maps/api/timezone/json') do |request|
      request.params['timestamp'] = current_time
      request.params['location'] = location
      request.params['key'] = ENV['google_geocode']
    end
    parsed_data = JSON.parse(json_response.body, symbolize_names: true)
  end

  def get_directions(origin, destination)
    json_response = conn.get('/maps/api/directions/json') do |request|
      request.params['origin'] = origin
      request.params['destination'] = destination
      request.params['key'] = ENV['google_geocode']
    end
    parsed_data = JSON.parse(json_response.body, symbolize_names: true)
  end

  private
  def conn
    Faraday.new(
        url: 'https://maps.googleapis.com',
        )
  end
end
