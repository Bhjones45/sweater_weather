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
        expect(roadtrip_info.travel_time).to eq('01 hours, 22 minuets')
        expect(roadtrip_info.waether_at_eta[:temperature]).to eq('80 F')
        expect(roadtrip_info.waether_at_eta[:conditions]).to eq('x')
      end
    end
  end
end
