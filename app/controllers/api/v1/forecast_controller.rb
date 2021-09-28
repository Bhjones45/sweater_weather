class Api::V1::ForecastController < ApplicationController
  def index
    forecast = WeatherFacade.forecast(params[:location])
    if forecast.nil?
      render json: { error: "Unable to find forecast" }, status: 400
    else
      render json: ForecastSerializer.new(forecast), status: 200
  end
end
end
