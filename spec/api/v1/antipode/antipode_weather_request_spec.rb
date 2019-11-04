require 'rails_helper'

describe "antipode weather endpoint" do
  it "can return current local weather and forecast for antipode city" do
    get "/api/v1/antipode?location=hongkong"

    expect(response).to be_successful

    json_response = JSON.parse(response.body, symbolize_names: true)

    #     {
    #     "data": [
    #         {
    #             "id": "1",
    #             "type": "antipode",
    #             "attributes": {
    #                 "location_name": "Antipode City Name",
    #                 "forecast": {
    #                     "summary": "Mostly Cloudy,
    #                     "current_temperature": "72",
    #                                 },
    #             "search_location": "Hong Kong"
    #             }
    #         }
    #     ]
    # }

    binding.pry

    expect(json_response[:data][:id]).to have_key("1")
    expect(json_response[:data][:type]).to have_key("antipode")
    expect(json_response[:data][:attributes]).to have_key(:location_name)
    expect(json_response[:data][:attributes][:forecast]).to have_key(:summary)
    expect(json_response[:data][:attributes][:forecast]).to have_key(:current_temperature)
    expect(json_response[:data][:search_location]).to eq("Hong Kong")
  end
end
