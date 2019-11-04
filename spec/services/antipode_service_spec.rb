require 'rails_helper'

describe 'antipode service' do
  it 'can return antipode city' do
    service = AntipodeService.new
    latitude = 22.3193
    longitude = -114.1694

    raw_data = service.get_antipode(latitude, longitude)

    expect(service).to be_a(AntipodeService)
    expect(raw_data).to be_a(Hash)

    expect(raw_data[:data][:attributes][:lat]).to eq(-22.3193)
    expect(raw_data[:data][:attributes][:long]).to eq(65.8306)
  end
end
