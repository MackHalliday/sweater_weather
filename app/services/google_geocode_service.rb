class GoogleGeocodeService

  def get_coordinates(city, state)
    json_response = conn.get('/maps/api/geocode/json') do |request|
      request.params['address'] = "#{city}+#{state}"
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
