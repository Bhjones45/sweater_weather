require 'rails_helper'
RSpec.describe RoadTripFacade do
  describe 'class methods' do
    describe '::get_road_trip' do
      it 'can return information about road trip', :vcr do
        roadtrip_data = RoadTripFacade.road_trip("denver,co", "estes park,co")

        expect(roadtrip_data).to be_a(RoadTripDetails)
        expect(roadtrip_data.id).to eq("null")
        expect(roadtrip_data.start_city).to eq('denver,co')
        expect(roadtrip_data.end_city).to eq('estes park,co')

        expect(roadtrip_data.weather_at_eta).to have_key(:temperature)
        expect(roadtrip_data.weather_at_eta).to have_key(:conditions)
      end
    end
  end
end
