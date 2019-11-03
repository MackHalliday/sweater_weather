require 'rails_helper'

describe 'google geocode service' do
  it 'can return longitude and ladiude for city' do
    service = GoogleGeocodeService.new
    city = "Denver"
    state = "Colorado"

    raw_data = service.get_coordinates(city, state)

    expect(service).to be_a(GoogleGeocodeService)
    expect(service).to be_a(Hash)
    expect(service[:formatted_address][:location][:lat]).to eq("39.7392358")
    expect(service[:formatted_address][:location][:lat]).to eq("-104.990251")
  end
end
