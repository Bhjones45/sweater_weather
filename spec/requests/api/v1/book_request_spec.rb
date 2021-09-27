require 'rails_helper'
RSpec.describe 'library API' do
  describe "book index" do
    it 'can return book details and forcast', :vcr do
      get '/api/v1/book-search?location=denver,co&limit=5'

      body = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(body).to have_key(:data)
      expect(body[:data]).to have_key(:id)
      expect(body[:data]).to have_key(:type)
      expect(body[:data]).to have_key(:attributes)

      expect(body[:data][:id]).to eq("null")
      expect(body[:data][:attributes]).to have_key(:destination)
      expect(body[:data][:attributes]).to have_key(:forecast)
      expect(body[:data][:attributes]).to have_key(:books)
      expect(body[:data][:attributes]).to have_key(:total_books_found)

      expect(body[:data][:attributes][:destination]).to eq("denver,co")

      expect(body[:data][:attributes][:forecast]).to have_key(:summary)
      expect(body[:data][:attributes][:forecast]).to have_key(:temperature)
      expect(body[:data][:attributes][:forecast][:summary]).to eq('Cloudy with a chance of meatballs')
      expect(body[:data][:attributes][:forecast][:temperature]).to eq('83 F')

      expect(body[:data][:attributes][:total_books_found]).to eq('172')

      expect(body[:data][:attributes][:books].count).to eq(5)
      expect(body[:data][:attributes][:books][0][:title]).to eq('Denver, Co')
      expect(body[:data][:attributes][:books][0][:publisher]).to eq('Universal Map Enterprises')
    end
  end
end
