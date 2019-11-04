class Location
  attr_reader :formated_address, :latitude, :longitude
  def initialize(geocode_data)
    @latitude = geocode_data[:results][0][:geometry][:location][:lat]
    @longitude = geocode_data[:results][0][:geometry][:location][:lng]
    @formated_address = geocode_data[:results][0][:formatted_address]
    @city = city
    @state = state
    @country = country
  end

  def parse_location
    @formated_address.split(',')
  end

  def city
    parse_location[0]
  end

  def state
    parse_location[1]
  end

  def country
    parse_location[2]
  end
end
