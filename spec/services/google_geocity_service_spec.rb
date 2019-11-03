require 'rails_helper'

describe 'google geocode service' do
  it 'can return longitude and ladiude for city' do
    service = GoogleGeocodeService.new
    city = "Denver"
    state = "Colorado"

    raw_data = service.get_coordinates(city, state)

    expect(service).to be_a(GoogleGeocodeService)
  end
end
