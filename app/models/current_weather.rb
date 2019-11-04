require 'date'

class CurrentWeather
  attr_reader :summary, :temperature
  def initialize(data)
    @time = time(data)
    @summary = data[:summary]
    @precipation_probability = data[:precipProbability]
    @temperature = data[:temperature]
    @apparent_temperature = data[:apparentTemperature]
    @humidity = data[:humidity]
    @visibility = data[:visibility]
    @uv_index = data[:uvIndex]
  end

  def time(data)
    Time.at(data[:time]).to_datetime
  end
end
