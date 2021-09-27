class BackgroundService
  def self.search_photos(location)
    new.request_api("/search/photos", location)
  end

  def request_api(path, location)
    response = conn("https://api.unsplash.com/").get(path) do |f|
      f.headers['Accept-Version'] = 'v1'
      f.params['client_id'] = ENV['UNSPLASH_KEY']
      f.params['query'] = location
      f.params['per_page'] = 1
    end
    parse_json(response)
  end

  def parse_json(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn(url)
    Faraday.new(url)
  end
end
