class BackgroundFacade
  def self.get_background(location)
    background = BackgroundService.search_photos(location)
    return 'Invalid Location' if background[:results].empty?
    BackgroundDetails.new(background, location)
  end
end
