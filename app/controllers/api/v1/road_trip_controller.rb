class Api::V1::RoadTripController < ApplicationController
  def create
    user = User.find_by(api_key: road_trip_params[:api_key])
    if user
      trip = RoadTripFacade.road_trip(road_trip_params[:origin], road_trip_params[:destination])
      render json: RoadTripSerializer.new(trip), status: 200
    else
      x
    end
  end

  private
    def road_trip_params
      params.permit(:origin, :destination, :api_key)
    end
end
