require 'rails_helper'
RSpec.describe "road trip api" do
  describe 'road trip post' do
    before(:each) do
      post '/api/v1/users', params: {
        "email": "test@pleasework.com",
        "password": "1234",
        "password_confirmation": "1234"
      }, as: :json

      @user_info = JSON.parse(response.body, symbolize_names: true)
    end

    it 'can return info about the road trip' do
      post '/api/v1/road_trip' params: {
        "origin": "Boise,ID",
        "destination": "Seattle,WA",
        "api_key": @user_info
      }, as: :json

      body = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(body[:data]).to have_key(:id)
      expect(body[:data]).to have_key(:attributes)

      expect(body[:data][:attributes]).to have_key(:start_city)
      expect(body[:data][:attributes]).to have_key(:end_city)
      expect(body[:data][:attributes]).to have_key(:travel_time)
      expect(body[:data][:attributes]).to have_key(:weather_at_eta)

      expect(body[:data][:attributes][:weather_at_eta]).to have_key(:temperature)
      expect(body[:data][:attributes][:weather_at_eta]).to have_key(:conditions)
    end
  end
end
