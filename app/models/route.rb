class Route
  def initialize(origin, destination, directions)
    @origin = origin
    @destination = destination
    @distance = directions[:routes][0][:legs]
    @arrival_time = directions[:routes][0][:legs]
  end
end
