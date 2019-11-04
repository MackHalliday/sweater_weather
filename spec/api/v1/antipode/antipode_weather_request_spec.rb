require 'rails_helper'

describe "antipode weather endpoint" do
  it "can return current local weather and forecast for antipode city" do
    get "/api/v1/antipode?location=hongkong"

    expect(response).to be_successful

    json_response = JSON.parse(response.body, symbolize_names: true)

    expect(json_response[:data][:id]).to eq("1")
    expect(json_response[:data][:type]).to eq("antipode")
    expect(json_response[:data][:attributes]).to have_key(:location_name)
    expect(json_response[:data][:attributes][:forecast]).to have_key(:summary)
    expect(json_response[:data][:attributes][:forecast]).to have_key(:current_temperature)
    expect(json_response[:data][:search_location]).to eq("Hong Kong")
  end
end
