class MapQuestFacade
  def self.coordinates(location)
    response = MapQuestService.get_coordinates(location)
    response[:results].first[:locations].first[:latLng]
  end
end
