class Route
  attr_reader :origin, :destination, :distance, :travel_time, :arrival_time, :arrival_time_unix
  def initialize(origin, destination, directions)
    @origin = origin.formatted_address
    @destination = destination.formatted_address
    @destination_timezone = destination.timezone
    @distance = directions[:routes][0][:legs][0][:distance][:text]
    @travel_time = directions[:routes][0][:legs][0][:duration][:text]
    @travel_time_seconds = directions[:routes][0][:legs][0][:duration][:value]
    @arrival_time = arrival_time
    @arrival_time_unix = arrival_time.to_i
  end

  def arrival_time
    #Need to add method to take into account time zone, Time.zone?
    Time.now.advance(seconds: @travel_time_seconds)
  end
end
