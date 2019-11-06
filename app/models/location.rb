class Location
  attr_reader :formatted_address, :latitude, :longitude
  def initialize(geocode_data)
    @latitude = geocode_data[:results][0][:geometry][:location][:lat]
    @longitude = geocode_data[:results][0][:geometry][:location][:lng]
    @formatted_address = geocode_data[:results][0][:formatted_address]
  end
end
