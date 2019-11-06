require 'date'

class Summary
  attr_reader :latitude, :longtitude

  def initialize(data, latitude, longitude)
    @current = data[:currently][:summary]
    @latitude = latitude
    @longitude = longitude
    @tonight = specific_time_summary(tonight_time)
    @today = specific_time_summary(today_time)
    @all_day = data[:hourly][:summary]
  end

  def tonight_time
    Time.now.change(hour: 18).to_i
  end

  def today_time
    Time.now.change(hour: 11).to_i
  end

  def forecasted_weather(time)
    DarkSkyService.new.get_forecasted_weather(@latitude, @longitude, time)
  end

  def specific_time_summary(time)
    forecasted_weather(time)[:currently][:summary]
  end
end
