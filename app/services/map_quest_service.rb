class MapQuestService
  def self.get_coordinates(location)
    new.request_api("/geocoding/v1/address?location=#{location}")
  end

  def self.find_route(start_city, end_city)
    new.request_api("/directions/v2/route?from=#{start_city}&to=#{end_city}")
  end

  def request_api(path)
    response = conn("http://www.mapquestapi.com").get(path) do |f|
      f.params['key'] = ENV['MAPQUEST_KEY']
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
