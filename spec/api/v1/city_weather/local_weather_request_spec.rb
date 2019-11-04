require 'rails_helper'

describe "local weather endpoint" do
  it "can return current local weather and forecast" do
  skip
    get "/api/v1/forecast?location=denver,co"

    expect(response).to be_successful

    json_response = JSON.parse(response.body, symbolize_names: true)

    expect(json_response[:location]).to have_key(:city)
    expect(json_response[:location]).to have_key(:state)
    expect(json_response[:location]).to have_key(:country)

    expect(json_response[:current_weather]).to have_key(:time)
    expect(json_response[:current_weather]).to have_key(:current_temp)
    expect(json_response[:current_weather]).to have_key(:high_temp)
    expect(json_response[:current_weather]).to have_key(:low_temp)
    expect(json_response[:current_weather]).to have_key(:weather_icon)

    expect(json_response[:details]).to have_key(:feels_like)
    expect(json_response[:details]).to have_key(:humidity)
    expect(json_response[:details]).to have_key(:visibility)
    expect(json_response[:details]).to have_key(:uv_index)
    expect(json_response[:details]).to have_key(:today_description)
    expect(json_response[:details]).to have_key(:tonight_description)
    expect(json_response[:details]).to have_key(:weather_icon)

    expect(json_response[:forecast]).to be_an(Array)
    expect(json_response[:forecast].count).to eq(8)

    (json_response[:forecast]).each do |date|
      expect(date).to have_key(:average_temp)
      expect(date).to have_key(:high_temp)
      expect(date).to have_key(:low_temp)
      expect(date).to have_key(:chance_of_precipitation)
      expect(date).to have_key(:weather_icon)
    end
  end
end
