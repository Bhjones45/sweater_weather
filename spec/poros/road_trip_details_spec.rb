require 'rails_helper'
RSpec.describe RoadTripDetails do
  describe 'class methods' do
    describe '::initialize' do
      it 'create road trip object', :vcr do
        forecast = WeatherFacade.forecast("estes park,co")
        time = Time.now + 5605

        info = {
          :start_city=>"denver,co",
          :end_city=>"estes park,co",
          :travel_time=>["01", "22", "49"],
          :weather=>forecast,
          :time=>time
        }

        roadtrip_info = RoadTripDetails.new(info)

        expect(roadtrip_info.id).to eq ("null")
        expect(roadtrip_info.start_city).to eq("denver,co")
        expect(roadtrip_info.end_city).to eq("estes park,co")
        expect(roadtrip_info.travel_time).to eq('01 hours, 22 minutes')
        expect(roadtrip_info.weather_at_eta[:temperature]).to eq(66.8)
        expect(roadtrip_info.weather_at_eta[:conditions]).to eq('overcast clouds')
      end

      it 'can return impossible message when cities are too far away', :vcr do
        forecast = WeatherFacade.forecast("london,uk")
        time = Time.now + 5605

        info = {
          :start_city=>"denver,co",
          :end_city=>"london,uk",
          :travel_time=>nil,
          :weather=>forecast,
          :time=>nil
        }

        roadtrip_info = RoadTripDetails.new(info)

        expect(roadtrip_info.id).to eq ("null")
        expect(roadtrip_info.start_city).to eq("denver,co")
        expect(roadtrip_info.end_city).to eq("london,uk")
        expect(roadtrip_info.travel_time).to eq('impossible route')
        expect(roadtrip_info.weather_at_eta[:temperature]).to eq(nil)
        expect(roadtrip_info.weather_at_eta[:conditions]).to eq(nil)
      end
    end
  end
end
