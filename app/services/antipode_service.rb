class AntipodeService

  def get_antipode(latitude, longitude)
    json_response = conn.get('/api/v1/antipodes') do |request|
      request.params['lat'] = latitude
      request.params['long'] = longitude
    end
    parsed_data = JSON.parse(json_response.body, symbolize_names: true)
  end

  private
  def conn
    Faraday.new(
        url: 'http://amypode.herokuapp.com',
        headers: { 'api_key' => "#{ENV['antipode']}" }
        )
  end
end
