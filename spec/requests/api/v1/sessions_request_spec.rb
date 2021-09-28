require 'rails_helper'
RSpec.describe "sessions api" do
  describe 'sessions post' do
    before(:each) do
      post '/api/v1/users', params: {
        "email": "test@pleasework.com",
        "password": "1234",
        "password_confirmation": "1234"
      }, as: :json

      body = JSON.parse(response.body, symbolize_names: true)

      @user = User.find(body[:data][:id].to_i)
    end

    it 'can create a session and login a user with correct params' do
      post '/api/v1/sessions', params: {
        "email": "test@pleasework.com",
        "password": "1234",
      }, as: :json

      body = JSON.parse(response.body, symbolize_names: true)


      expect(body[:data][:attributes][:email]).to eq("test@pleasework.com")
      expect(body[:data][:attributes][:api_key]).to eq(@user.api_key)
    end
  end
end
