

# Sweater Weather
#### Created by: [Mack Halliday](https://github.com/MackHalliday)

### About the Project

* [Project Requirements](https://backend.turing.io/module3/projects/sweater_weather)

* [GitHub Project Board](https://github.com/MackHalliday/sweater_weather/projects/1)

 SweaterWeather is an API application with endpoints to return local weather, a city background image, and roadtrip information. The application also can create and login a user with a post request.

## Endpoints

### Root 
Application address

``` https://sweater-weather-halliday.herokuapp.com/```

### Local Weather
Returns current weather and forecast for location

``` GET /api/v1/forecast?location=denver,co```

```location```: desired city location with state or country

[View Example](https://sweater-weather-halliday.herokuapp.com/api/v1/forecast?location=denver,co)
### City Background Image

  Returns large image with orientation as landscape

  ``` GET /api/v1/backgrounds?location=denver,co```

  ```location```: desired city location with state or country

  [View Example](https://sweater-weather-halliday.herokuapp.com/api/v1/backgrounds?location=denver,co)

### Create User Account

  Creates a user with valid emails and password matching password confirmation
  
  If successful, will return user's API key and 201 status

  ```POST /api/v1/users```
  
  ``` body 
    {
     "email": "whatever@example.com",
     "password": "password",
     "password_confirmation": "password"
     }
  ```
  
  ```email```: Must be valid email not already used by another user
  
  ```password```: Desired password
  
  ```password_confirmation```: Must match password
  
[![Run in Postman](https://run.pstmn.io/button.svg)](https://app.getpostman.com/run-collection/0391478d4797e0605eef)

### Login User

  Logins in user with correct password
  
  If successful, will return user's API key and 201 status
  

  ```POST /api/v1/sessions ```
  
  ``` body 
    {
     "email": "whatever@example.com",
     "password": "password",
     }
  ```
  
  ```email```: Must match email used to create account
  
  ```password```: Must match password used to create account
  
  [![Run in Postman](https://run.pstmn.io/button.svg)](https://app.getpostman.com/run-collection/02164a249f505f30e528)
  
### Road Trip

  Returns details for road trip including travel time and weather at destination
  
  If successful, will return details for road trip

  Must include valid API key

  ``` POST /api/v1/road_trip ```
  
  ``` body 
    {
      origin: "Denver,CO",
      destination: "Pueblo,CO",
      api_key: "YOUR_API_KEY"
     }
  ```
  
  ```origin```: Starting city with state or country
  
  ```destination```: Ending cit with state or country 
  
  ```api_key```: Valid API key given to user when account created
  
  [![Run in Postman](https://run.pstmn.io/button.svg)](https://app.getpostman.com/run-collection/25c04179c6f5520f5215)

## Local Setup

Clone down the repo
```
$ git clone
```

Install the gem packages
```
$ bundle install
```

Set up the database
```
$ rake db:create
$ rake db:migrate

```

Add the following API Key to your `application.yml` file

``` 
google_geocode: YOUR_GOOGLE_API_KEY
dark_sky: YOUR_DARK_SKY_API_KEY
antipode: oscar_the_grouch
unsplash_access_key: YOUR_UNSPLASH_API_KEY
```
  Where to get API Keys
   * [Google](https://developers.google.com/maps/documentation/javascript/get-api-key)
   * [Dark_Sky](https://darksky.net/dev)
   * [Unsplash](https://unsplash.com/developers)

## Testing Suite
Run the test suite:
```
$ rspec
```

## Running Application Locally 
Run application locally:
```
$ rails s
```
- Visit `http://localhost:3000/` in Chrome browser 
- Add desired endpoint to localhost address

## Technologies

* [vcr](https://github.com/vcr/vcr)
* [figaro](https://github.com/laserlemon/figaro)

### Versions
* Ruby 2.4.1
* Rails 5.2.0
