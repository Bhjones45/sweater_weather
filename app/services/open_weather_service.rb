class OpenWeatherService
  def self.get_forecast_data(coordinates)
    new.request_api("/data/2.5/onecall?lat=#{coordinates[:lat]}&lon=#{coordinates[:lng]}&exclude={part}")
  end

  def request_api(path)
    response = conn("https://api.openweathermap.org/").get(path) do |f|
      f.params['appid'] = ENV['OPENWEATHER_KEY']
      f.params['units'] = 'imperial'
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
