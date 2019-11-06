require 'rails_helper'

describe "background image endpoint" do
  it "can return a background image for a city" do

    get "/api/v1/backgrounds?location=denver,co"

    expect(response).to be_successful

    json_response = JSON.parse(response.body, symbolize_names: true)

    expect(json_response[:data]).to have_key(:unsplash_id)
    expect(json_response[:data]).to have_key(:width)
    expect(json_response[:data]).to have_key(:height)
    expect(json_response[:data]).to have_key(:description)
    expect(json_response[:data]).to have_key(:url)
  end
end
