require 'rails_helper'

describe "antipode weather endpoint" do
  it "can return current local weather and forecast for antipode city" do
    get "/api/v1/antipode?location=hongkong"

    expect(response).to be_successful

    json_response = JSON.parse(response.body)

    expect(json_response).to have_key(:start_city)
    expect(json_response).to have_key(:antipode)
    expect(json_response).to have_key(:antipode_weather)
  end
end
