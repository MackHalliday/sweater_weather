class BackgroundsFacade
  def initialize(location)
    @location = location
  end

  def geocode_data
    @geocode_date ||= GoogleService.new.get_geocode_data(@location)
  end

  def location_info
    @location_info ||= Location.new(geocode_data)
  end

  def unsplash_data
    @dark_sky_data ||= UnsplashService.new.get_background(location_info.formatted_address)
  end

  def data
    BackgroundsData.new(unsplash_data)
  end
end
