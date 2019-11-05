require 'rails_helper'

describe 'unsplash service' do
  it 'can return a background for a city', :vcr do
    service = UnsplashService.new
    city = denver,co

    raw_data = service.get_background(city)

    expect(service).to be_a(UnsplashService)
    expect(raw_data).to be_a(Hash)
  end
end
