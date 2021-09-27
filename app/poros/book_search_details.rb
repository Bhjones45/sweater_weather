class BookSearchDetails
  attr_reader :destination,
              :forecast,
              :books,
              :total_books_found

  def initialize(details)
    @destination = details[:destination]
    @forecast = details[:forecast]
    @total_books_found = details[:total_books_found]
    @books = details[:books]
  end
end
