require 'rails_helper'

describe "local weather endpoint" do
  it "can return current local weather and forecast" do

    get "/api/v1/forecast?location=denver,co"

    expect(response).to be_successful

    json_response = JSON.parse(response.body, symbolize_names: true)

    expect(json_response[:data][:location]).to have_key(:formatted_address)

    expect(json_response[:data][:summary]).to have_key(:current)
    expect(json_response[:data][:summary]).to have_key(:tonight)
    expect(json_response[:data][:summary]).to have_key(:today)
    expect(json_response[:data][:summary]).to have_key(:all_day)

    expect(json_response[:data][:current_weather]).to have_key(:time)
    expect(json_response[:data][:current_weather]).to have_key(:summary)
    expect(json_response[:data][:current_weather]).to have_key(:precipation_probability)
    expect(json_response[:data][:current_weather]).to have_key(:apparent_temperature)
    expect(json_response[:data][:current_weather]).to have_key(:humidity)
    expect(json_response[:data][:current_weather]).to have_key(:visibility)
    expect(json_response[:data][:current_weather]).to have_key(:uv_index)

    expect(json_response[:data][:daily_weather]).to be_an(Array)
    expect(json_response[:data][:daily_weather].count).to eq(8)

    (json_response[:data][:daily_weather]).each do |date|
      expect(date).to have_key(:id)
      expect(date).to have_key(:time)
      expect(date).to have_key(:summary)
      expect(date).to have_key(:precipation_probability)
      expect(date).to have_key(:temperature_high)
      expect(date).to have_key(:temperature_low)
      expect(date).to have_key(:humidity)
      expect(date).to have_key(:visibility)
      expect(date).to have_key(:uv_index)
    end

    expect(json_response[:data][:hourly_weather]).to be_an(Array)
    expect(json_response[:data][:hourly_weather].count).to eq(8)

    (json_response[:data][:hourly_weather]).each do |date|
      expect(date).to have_key(:id)
      expect(date).to have_key(:time)
      expect(date).to have_key(:summary)
      expect(date).to have_key(:precipation_probability)
      expect(date).to have_key(:temperature_high)
      expect(date).to have_key(:temperature_low)
      expect(date).to have_key(:humidity)
      expect(date).to have_key(:visibility)
      expect(date).to have_key(:uv_index)
    end
  end
end
