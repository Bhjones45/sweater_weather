require 'rails_helper'
RSpec.describe "Forecast API" do
  describe 'Forecast Index' do
    it 'can return forecast for a city', :vcr do
      get '/api/v1/forecast?location=boise,id'

      body = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(body[:data]).to have_key(:id)
      expect(body[:data]).to have_key(:type)
      expect(body[:data]).to have_key(:attributes)
      expect(body[:data][:attributes]).to have_key(:current_weather)
      expect(body[:data][:attributes]).to have_key(:daily_weather)
      expect(body[:data][:attributes]).to have_key(:hourly_weather)
    end
  end
end
