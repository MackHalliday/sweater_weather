class Route
  def initialize(origin, destination, directions)
    @origin = origin.formatted_address
    @destination = destination.formatted_address
    @destination_timezone = destination.timezone
    @distance = directions[:routes][0][:legs]
    @travel_time = directions[:routes][0][:legs][0][:duration][:text]
    @travel_time_seconds = directions[:routes][0][:legs][0][:duration][:value]
    @arrival_time = arrival_time
  end

  def arrival_time
    #Need to add method to take into account time zone, Time.zone?
    Time.now.advance(seconds: @travel_time_seconds)
  end
end
