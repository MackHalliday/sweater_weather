# Sweater Weather
#### Created by: [Mack Halliday](https://github.com/MackHalliday)

[Visit the Deployed Verison of the Application Here](https://warm-oasis-92262.herokuapp.com/)

### About the Project

* [Project Requirements](https://backend.turing.io/module3/projects/sweater_weather)

* [GitHub Project Board](https://github.com/MackHalliday/sweater_weather/projects/1)

 SweaterWeather is an API application with endpoints to return local weather, a city background image, and roadtrip information. The application also can create and login a user with a post request.

## Endpoints
#### Local Weather
```/api/v1/forecast?location=denver,co```

```location```: desired city location
[Example](https://sweater-weather-halliday.herokuapp.com/api/v1/forecast?location=denver,co)
#### City Background Image
```/api/v1/backgrounds?location=denver,co```

```location```: desired city location

Returns large image with orientation as landscape

[Example](https://sweater-weather-halliday.herokuapp.com/api/v1/backgrounds?location=denver,co)
#### Create User Account
```/api/v1/users```
#### Login User
``` /api/v1/sessions ```
#### Road Trip
``` /api/v1/road_trip ```


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
[Google](https://developers.google.com/maps/documentation/javascript/get-api-key)
[Dark_Sky](https://darksky.net/dev)
[Unsplash](https://unsplash.com/developers)

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
NEED TO FINISH ADDING TECHS
* [Stimulus](https://github.com/stimulusjs/stimulus)
* [will_paginate](https://github.com/mislav/will_paginate)
* [acts-as-taggable-on](https://github.com/mbleigh/acts-as-taggable-on)
* [webpacker](https://github.com/rails/webpacker)
* [vcr](https://github.com/vcr/vcr)
* [selenium-webdriver](https://www.seleniumhq.org/docs/03_webdriver.jsp)
* [chromedriver-helper](http://chromedriver.chromium.org/)
* [figaro](https://github.com/laserlemon/figaro)

### Versions
* Ruby 2.4.1
* Rails 5.2.0
