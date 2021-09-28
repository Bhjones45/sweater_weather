class RoadTripDetails
  attr_reader :id,
              :start_city,
              :end_city,
              :travel_time,
              :weather_at_eta

  def initialize(details)
    @id = "null"
    @start_city = details[:start_city]
    @end_city = details[:end_city]
    @travel_time = format_time(details)
    @weather_at_eta = format_weather(details)
  end

  def format_time(details)
    if details[:time].nil?
      "unvailable route"
    elsif details[:time] < (Time.now + 300000)
      "#{details[:travel_time][0]} hours, #{details[:travel_time][1] minutes}"
    end
  end
end
