require 'rails_helper'
RSpec.describe 'Random Recipes API' do
  describe 'index GET /api/v1/random_recipes' do
    describe 'happy path' do
      it 'returns json request' do
        get '/api/v1/random_recipes?count=4'
        recipes = JSON.parse(response.body, symbolize_names: true)

        expect(response).to be_successful

        recipe = recipes[:Recipes].first
        expect(recipe).to have_key(:ID)
        expect(recipe[:ID]).to be_a String
        expect(recipe).to have_key(:Title)
        expect(recipe[:Title]).to be_a String
        expect(recipe).to have_key(:Image_URL)
        expect(recipe[:Image_URL]).to be_a String
      end
    end
  end
end
