require 'rails_helper'
RSpec.describe 'Random Recipes API', type: :request do
  describe 'index GET /api/v1/random_recipes' do
    describe 'happy path' do
      it 'returns json request' do
        get '/api/v1/random_recipes?count=4'
        recipes = JSON.parse(response.body, symbolize_names: true)

        expect(response).to be_successful
        expect(recipes).to be_a Hash

        expect(recipes).to have_key(:Recipes)
        expect(recipes[:Recipes]).to be_an Array

        expect(recipes[:Recipes[0]]).to be_a Hash
        expect(recipes[:Recipes[0]]).to have_key(:ID)
        expect(recipes[:Recipes[0]][(:ID)]).to be_a String

        expect(recipes[:Recipes[0]]).to have_key(:Title)
        expect(recipes[:Recipes[0]][(:ID)]).to be_a String
        
        expect(recipes[:Recipes[0]]).to have_key(:Image_URL)
        expect(recipes[:Recipes[0]][(:ID)]).to be_a String
 
      end
    end
  end
end