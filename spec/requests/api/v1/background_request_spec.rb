require 'rails_helper'
RSpec.describe "Background api" do
  describe 'background index' do
    it 'can return a background image', :vcr do
      get '/api/v1/backgrounds?location=boise,id'

      body = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(body).to have_key(:data)
      expect(body[:data]).to have_key(:attributes)
      expect(body[:data][:attributes]).to have_key(:info)
    end
  end
end
