class Location
  attr_reader :formatted_address, :latitude, :longitude, :timezone
  def initialize(geocode_data)
    @latitude = geocode_data[:results][0][:geometry][:location][:lat]
    @longitude = geocode_data[:results][0][:geometry][:location][:lng]
    @formatted_address = geocode_data[:results][0][:formatted_address]
    @timezone = timezone
  end

  def current_time
    Time.now.to_i
  end

  def string_coordinates
    "#{@latitude}, #{@longitude}"
  end

  def time_zone_data
    GoogleService.new.get_timezone(current_time, string_coordinates)
  end

  def timezone
    time_zone_data[:timeZoneName]
  end
end
