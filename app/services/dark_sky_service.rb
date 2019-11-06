class DarkSkyService

  def get_weather(latitude, longitude)
    json_response = conn.get("/forecast/#{ENV['dark_sky']}/#{latitude},#{longitude}")
    parsed_data = JSON.parse(json_response.body, symbolize_names: true)
  end

  def get_forecasted_weather(latitude, longitude, arrival_time)
    json_response = conn.get("/forecast/#{ENV['dark_sky']}/#{latitude},#{longitude},#{arrival_time}")
    parsed_data = JSON.parse(json_response.body, symbolize_names: true)
  end

  private
  def conn
    Faraday.new(
        url: 'https://api.darksky.net',
        )
  end
end
