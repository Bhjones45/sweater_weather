class BookSearchService
  def self.search_books(location, quantity)
    new.request_api("/search.json?q=#{location}&quantity=#{quantity}")
  end

  def request_api(path)
    response = conn("http://openlibrary.org/").get(path)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn(url)
    Faraday.new(url)
  end
end
