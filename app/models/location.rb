class Location
  attr_reader :formated_address, :latitude, :longitude
  def initialize(geocode_data)
    @formated_address = geocode_data[:results][0][:formatted_address]
    @latitude = geocode_data[:results][0][:geometry][:location][:lat]
    @longitude = geocode_data[:results][0][:geometry][:location][:lng]
  end
end
