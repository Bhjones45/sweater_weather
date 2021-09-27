require 'rails_helper'

RSpec.describe BackgroundService do
  describe 'class methods' do
    describe '::serach_photos' do
      it 'can connect to unsplash', :vcr do
        response = BackgroundService.search_photos("boise,id")
        expect(response).to be_a(Hash)
      end
    end
  end
end
