class BookSearchFacade
  def self.get_books(location, quantity)
    coordinates = MapQuestFacade.coordinates(location)
    books = BookSearchService.search_books(location, quantity)
    forecast_data = OpenWeatherService.get_forecast_data(coordinates)
    temp = forecast.current_weather[:temperature]
    forecast = ForecastDetails.new(data)
    list_books = format_books(books)
    details = format_details(location, forecast, temp, list_books)
    BookSearchDetails.new(details)
  end

  def self.format_books(books)
    books.map do |book|
      {
        isbn: book[:isbn],
        title: book[:title],
        publisher: book[:publisher]
      }
    end
  end

  def self.format_details(location, forecast, temp, list_books)
    {
      destination: location,
      forecast: {
        summary: forecast.current_weather[:conditions],
        temperature: "#{temp} F"
      },
      total_books_found: books.count,
      books: list_books
    }
  end
end
