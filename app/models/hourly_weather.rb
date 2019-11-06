require 'date'

class HourlyWeather
  def initialize(data, index)
    @id = index
    @time = time(data)
    @summary = data[:summary]
    @precipation_probability = data[:precipProbability]
    @temperature_high = data[:temperatureHigh]
    @temperature_low = data[:temperatureLow]
    @humidity = data[:humidity]
    @visibility = data[:visibility]
    @uv_index = data[:uvIndex]
  end

  def time(data)
    Time.at(data[:time]).to_datetime
  end
end
