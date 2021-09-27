require 'rails_helper'
RSpec.describe OpenWeatherService do
  describe 'class methods' do
    describe '::get_forecast_data' do
      it 'can connect with API' do
        VCR.use_cassette("open_weather_forecast") do
          coordinates = { lat: 43, lng: 116}
          response = OpenWeatherService.get_forecast_data(coordinates)

          expect(response).to be_a(Hash)
          expect(response[:lat]).to eq(coordinates[:lat])
          expect(response[:lon]).to eq(coordinates[:lng])
          expect(response[:lat]).to_not eq(100)
          expect(response[:lon]).to_not eq(100)
        end
      end
    end
  end
end
