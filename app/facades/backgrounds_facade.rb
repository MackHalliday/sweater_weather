class BackgroundsFacade
  def initialize(location)
    @location = location
  end


  def data
    BackgroundsData.new(image_data)
  end
end
