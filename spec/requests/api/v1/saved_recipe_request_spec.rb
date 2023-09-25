# rubocop:disable RSpec/ExampleLength
require 'rails_helper'

RSpec.describe 'Recipe API' do
  let(:user) { create(:user) }

  describe 'show recipe information' do
    context 'when the recipe exists', :vcr do
      let(:recipe_id) { '52772' }
      let(:expected_attributes) do
        {
          id: recipe_id,
          type: 'recipe',
          attributes: {
            name: 'Teriyaki Chicken Casserole',
            picture: 'https://www.themealdb.com/images/media/meals/wvpsxx1468256321.jpg',
            link: nil,
            video_link: 'https://www.youtube.com/watch?v=4aZr5hZXP_s',
            cuisine_type: 'Japanese',
            ingredients: [
              { quantity: '3/4 cup', item: 'soy sauce' },
              { quantity: '1/2 cup', item: 'water' },
              { quantity: '1/4 cup', item: 'brown sugar' },
              { quantity: '1/2 teaspoon', item: 'ground ginger' },
              { quantity: '1/2 teaspoon', item: 'minced garlic' },
              { quantity: '4 Tablespoons', item: 'cornstarch' },
              { quantity: '2', item: 'chicken breasts' },
              { quantity: '1 (12 oz.)', item: 'stir-fry vegetables' },
              { quantity: '3 cups', item: 'brown rice' }
            ],
            directions: include('Preheat oven to 350° F.')
          }
        }
      end

      it 'returns recipe information correctly' do
        get "/api/v1/recipe/#{recipe_id}", headers: { 'Content-Type' => 'application/json' }
        recipe = JSON.parse(response.body, symbolize_names: true)[:data]

        expect(response).to be_successful
        expect(recipe).to match(expected_attributes)
      end
    end

    context 'when the recipe does not exist', :vcr do
      let(:recipe_id) { '1' }

      it 'returns an error message' do
        get "/api/v1/recipe/#{recipe_id}", headers: { 'Content-Type' => 'application/json' }
        recipe = JSON.parse(response.body, symbolize_names: true)[:data]

        expect(response).not_to be_successful
        expect(recipe).to include(
          id: nil,
          type: 'error',
          attributes: {
            error_msg: 'No recipe has id 1',
            status: 503
          }
        )
      end
    end
  end
end

# rubocop:enable RSpec/ExampleLength
