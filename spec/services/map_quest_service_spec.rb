require 'rails_helper'
RSpec.describe 'class methods' do
  describe '::get_coordinates' do
    it 'can connect to map quest', :vcr do
      response = MapQuestService.get_coordinates("boise,id")

      expect(response).to be_a(Hash)
      expect(response).to have_key(:info)
      expect(response[:info]).to have_key(:statuscode)
      expect(response[:results].first).to have_key(:providedLocation)
    end
  end

  describe '::find_route' do
    it 'can return route between two cities', :vcr do
      response = MapQuestService.find_route('denver,co', 'Estes park,co')

      expect(response).to be_a(Hash)
      expect(response[:route]).to have_key(:distance)
      expect(response[:route][:distance]).to have_key(71.433)
      expect(response[:route][:realTime]).to have_key(5510)
    end
  end
end
