require 'rails_helper'
RSpec.describe 'user requests' do
  describe 'user post' do
    before(:each) do
      User.destroy_all
    end

    it 'can create a user', :vcr do
      post '/api/v1/users', params: {
        "email": 'who@test.com',
        "password": "1234",
        "password_confirmation": "1234"
      }, as: :json

      body = JSON.parse(resonse.body, symbolize_names: true)

      expect(response.status).to eq(201)
      expect(body[:data]).to be_a(Hash)
      expect(body[:data]).to have_key(:id)
      expect(body[:data]).to have_key(:attributes)

      expect(body[:data][:attributes]).to have_key(:email)
      expect(body[:data][:attributes]).to have_key(:api_key)
      expect(body[:data][:attributes][:email]).to eq('who@test.com')
    end

    it 'cannot create a user' do
      post '/api/v1/users', params: {
        "email": 'who@test.com'
      }, as: :json

      body = JSON.parse(resonse.body, symbolize_names: true)

      expect(response.status).to eq(422)
      expect(body[:error]).to eq("Invaild email or password.")
    end
  end
end
