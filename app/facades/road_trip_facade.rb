class RoadTripFacade
  def self.road_trip(start_city, end_city)
    forecast = WeatherFacade.forecast(end_city)
    route= MapQuestService.find_route(start_city, end_city)
    travel_time = view_travel_time(route)
    time = view_time(route)

    info = {
      start_city: start_city,
      end_city: end_city,
      travel_time: travel_time,
      weather: forecast,
      time: time
    }

    RoadTripDetails.new(info)
  end

  def self.view_travel_time(route)
    if route[:route][:routeError][:errorCode] == (-400)
      route[:route][:formattedTime].split(':')
    else
      nil
    end
  end

  def self.view_time(route)
    if route[:route][:routeError][:errorCode] == (-400)
      Time.now + route[:route][:realTime]
    else
      nil
    end
  end
end
