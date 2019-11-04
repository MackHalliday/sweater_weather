class Summary
  def initialize(data)
    @current = data[:currently][:summary]
    @in_six_hours = data[:hourly][:data][5][:summary]
    @in_twelve_hours = data[:hourly][:data][11][:summary]
    @all_day = data[:hourly][:summary]
  end
end
