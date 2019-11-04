class GoogleGeocodeService

  def get_geocode_data(location)
    json_response = conn.get('/maps/api/geocode/json') do |request|
      request.params['address'] = location
      request.params['key'] = ENV['google_geocode']
    end
    parsed_data = JSON.parse(json_response.body, symbolize_names: true)
  end

  def reverse_geocode(latitude, longitude)
    json_response = conn.get('/maps/api/geocode/json') do |request|
      request.params['latlng'] = "#{latitude}, #{longitude}"
      request.params['result_type'] = "administrative_area_level_1"
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
