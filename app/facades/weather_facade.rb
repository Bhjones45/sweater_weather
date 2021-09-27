class WeatherFacade
  def self.forecast(location)
    coordinates = MapQuestFacade.coordinates(location)
    data = OpenWeatherService.get_forecast_data(coordinates)
    ForecastDetails.new(data)
  end
end
