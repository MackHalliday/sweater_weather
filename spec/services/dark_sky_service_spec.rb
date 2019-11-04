require 'rails_helper'

describe 'dark sky service' do
  it 'can return weather forcast', :vcr do
    service = DarkSkyService.new
    longitude = 39.7392358
    latitude = -104.990251

    raw_data = service.get_weather(longitude, latitude)

    expect(service).to be_a(DarkSkyService)
    expect(raw_data).to be_a(Hash)
    expect(raw_data[:currently]).to have_key(:time)
    expect(raw_data[:currently]).to have_key(:summary)
    expect(raw_data[:currently]).to have_key(:temperature)
  end
end
