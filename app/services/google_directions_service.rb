class GoogleDirectionsService

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
