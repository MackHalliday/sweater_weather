require 'rails_helper'

describe 'google geocode service' do
  it 'can return longitude and ladiude for city', :vcr do
    service = GoogleGeocodeService.new
    location = "Denver, Colorado"

    raw_data = service.get_geocode_data(location)

    expect(service).to be_a(GoogleGeocodeService)
    expect(raw_data).to be_a(Hash)
    expect(raw_data[:results][0][:geometry][:location][:lat]).to eq(39.7392358)
    expect(raw_data[:results][0][:geometry][:location][:lng]).to eq(-104.990251)
  end

  it 'can lookup address by latitude and longitude', :vcr do
    service = GoogleGeocodeService.new
    latitude = -22.3193039
    longitude = -65.8306389

    raw_data = service.reverse_geocode(latitude, longitude)

    expect(service).to be_a(GoogleGeocodeService)
    expect(raw_data).to be_a(Hash)
    expect(raw_data[:results][0][:formatted_address]).to eq("Jujuy, Argentina")
  end
end
