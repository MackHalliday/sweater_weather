class BackgroundsData
  def initialize(data)
    @unsplash_id = data[:id]
    @width = data[:width]
    @height = data[:height]
    @description = data[:description]
    @url = data[:urls][:full]
  end
end
