require 'rails_helper'
describe "login endpoint" do
  it "can login user" do

    user = User.create!(email: "whatever@example.com", password: "password", token: "123")

    request_body = {
                    "email": "whatever@example.com",
                    "password": "password",
                    }

    post "/api/v1/sessions", as: :json, params: request_body

    expect(response).to have_http_status(201)

    expected_response = {"api_key": "123"}

    expect(response.body).to eq(expected_response.to_json)
  end

  it "cannot login user with wrong email" do

    user = User.create!(email: "whatever@example.com", password: "password", token: "123")

    request_body = {
                    "email": "wrong_email@example.com",
                    "password": "password",
                    }

    post "/api/v1/sessions", as: :json, params: request_body

    expect(response).to have_http_status(400)

    expected = {error: "Invalid email or password."}

    expect(response.body).to eq(expected.to_json)
  end

  it "cannot login user with wrong password" do

    user = User.create!(email: "whatever@example.com", password: "password", token: "123")

    request_body = {
                    "email": "whatever@example.com",
                    "password": "wrong_password",
                    }

    post "/api/v1/sessions", as: :json, params: request_body

    expect(response).to have_http_status(400)

    expected = {error: "Invalid email or password."}

    expect(response.body).to eq(expected.to_json)
  end
end
