require 'rails_helper'

describe 'dark sky service' do
  it 'can return weather forcast', :vcr do
    service = DarkSkyService.new
    longitude = "Denver"
    latitude = "Colorado"

    #https://api.darksky.net/forecast/API_KEY/39.7392358,-104.990251

    raw_data = service.get_weather(longitude, latitude)

    expect(service).to be_a(DarkSkyService)
    expect(raw_data).to be_a(Hash)
    expect(raw_data[:currently]).to has_key(:time)
    expect(raw_data[:currently]).to has_key(:summary)
    expect(raw_data[:currently]).to has_key(:temperature)
  end
end
