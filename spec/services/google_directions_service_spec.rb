require 'rails_helper'

describe 'google directions service' do
  it 'can return directions', :vcr do
    #example
    #https://maps.googleapis.com/maps/api/directions/json?origin=Denver,Co&destination=Pueblo,CO&key=GOOGLE_API_KEY
    service = GoogleService.new
    origin = "Denver,CO"
    destination = "Pueblo,CO"

    raw_data = service.get_directions(origin, destination)

    expect(service).to be_a(GoogleService)
    expect(raw_data).to be_a(Hash)
    expect(raw_data[:routes][0]).to have_key(:legs)
  end
end
