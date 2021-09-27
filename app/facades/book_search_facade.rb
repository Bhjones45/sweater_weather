class BookSearchFacade
  def self.get_books(location, quantity)
    coordinates = MapQuestFacade.coordinates(location)
    books = BookSearchService.search_books(location, quantity)
    data = OpenWeatherService.get_forecast_data(coordinates)
    forecast = ForecastDetails.new(data)
    temp = forecast.current_weather[:temperature]
    list_books = format_books(books)
    details = format_details(location, forecast, temp, books, list_books)
    BookSearchDetails.new(details)
  end

  def self.format_books(books)
    books[:docs].map do |book|
      {
        isbn: book[:isbn],
        title: book[:title],
        publisher: book[:publisher]
      }
    end
  end

  def self.format_details(location, forecast, temp, books, list_books)
    {
      destination: location,
      forecast: {
        summary: forecast.current_weather[:conditions],
        temperature: "#{temp} F"
      },
      total_books_found: books[:num_found],
      books: list_books
    }
  end
end
