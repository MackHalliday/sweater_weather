class UnsplashService

  def get_background(location, weather)
    json_response = conn.get('/photos/random') do |request|
      request.params['query'] = "#{location}+#{weather}"
      request.params['client_id'] = ENV['unsplash_access_key']
    end
    parsed_data = JSON.parse(json_response.body, symbolize_names: true)
  end

  private
  def conn
    Faraday.new(
        url: 'https://api.unsplash.com',
        )
  end
end
