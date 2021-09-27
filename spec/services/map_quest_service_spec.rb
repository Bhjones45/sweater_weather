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
end
