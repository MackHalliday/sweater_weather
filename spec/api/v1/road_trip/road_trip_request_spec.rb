require 'rails_helper'

describe "roadtrip endpoint" do
  it "can return a directions and weather for roadtrip" do

    user = User.create!(email: "whatever@example.com", password: "password", token: "jgn983hy48thw9begh98h4539h4")

    request_body = {
                    origin: "Denver,CO",
                    destination: "Pueblo,CO",
                    api_key: "jgn983hy48thw9begh98h4539h4"
                    }

    post "/api/v1/road_trip", as: :json, params: request_body

    expect(response).to have_http_status(200)

    json_response = JSON.parse(response.body, symbolize_names: true)

    expect(json_response[:data][:trip]).to have_key(:origin)
    expect(json_response[:data][:trip]).to have_key(:destination)
    expect(json_response[:data][:trip]).to have_key(:distance)
    expect(json_response[:data][:trip]).to have_key(:estimated_arrival)
    expect(json_response[:data][:arrival_forecast]).to have_key(:summary)
    expect(json_response[:data][:arrival_forecast]).to have_key(:temperature)
  end

  it "renders 401 if invalid api key" do
    skip
    user = User.create!(email: "whatever@example.com", password: "password", token: "jgn983hy48thw9begh98h4539h4")

    request_body = {
                    origin: "Denver,CO",
                    destination: "Pueblo,CO",
                    api_key: "123"
                    }

    post "/api/v1/road_trip", as: :json, params: request_body

    expect(response).to have_http_status(401)

    expected = {error: "Invalid request."}

    expect(response.body).to eq(expected.to_json)
  end
end
