describe "create account endpoint" do
  it "can create an user account" do

    request_body = {
                    "email": "whatever@example.com",
                    "password": "password",
                    "password_confirmation": "password"
                    }

    post "/api/v1/users", as: :json, params: request_body

    user = User.last

    expect(user.email).to eq("whatever@example.com")

    #CANNOT STORE USER PASSWORD IN DB
    expect(user.password).to eq("whatever@example.com")
    expect(user.password_confirmation).to eq("whatever@example.com")

    expect(response).to have_http_status(201)

    expected_response = {
                        "api_key": "jgn983hy48thw9begh98h4539h4",
                        }

    expect(response.body).to eq(expected_response)
  end
end
