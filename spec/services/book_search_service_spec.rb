require 'rails_helper'
RSpec.describe 'class methods' do
  describe 'class methods' do
    it 'can connect to book search API' do
      location = 'denver,co'
      response = BookSearchService.search_books(location, 7)

      expect(response).to be_a(Hash)
      expect(response.count).to eq(7)
    end
  end
end
