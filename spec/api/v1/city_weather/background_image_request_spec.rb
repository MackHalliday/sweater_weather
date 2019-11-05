require 'rails_helper'

describe "background image endpoint" do
  it "can return a background image for a city" do

    get "/api/v1/backgrounds?location=denver,co"

    expect(response).to be_successful

    json_response = JSON.parse(response.body, symbolize_names: true)

    expect(json_response[:data]).to have_key(:image)
    expect(json_response[:data][:image]).to have_key(:title)
    expect(json_response[:data][:image]).to have_key(:description)
    expect(json_response[:data][:image]).to have_key(:url)
  end
end
