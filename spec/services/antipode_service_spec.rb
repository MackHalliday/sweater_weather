require 'rails_helper'

describe 'antipode service' do
  it 'can return antipode city', :vcr do
    service = AntipodeService.new
    longitude = 22.3193
    latitude = -114.1694

    #http://amypode.herokuapp.com/api/v1/antipodes?lat=22.3193&long=-114.1694

    raw_data = service.get_antipoder(longitude, latitude)

    expect(service).to be_a(AntipodeService)
    expect(raw_data).to be_a(Hash)

    expect(raw_data[:data][:attributes][:lat]).to eq(-22.3193)
    expect(raw_data[:data][:attributes][:long]).to eq(-65.8306)
  end
end
