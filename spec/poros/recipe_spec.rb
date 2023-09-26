require 'rails_helper'

RSpec.describe Recipe do
  context 'when a PORO is created with valid data' do
    # set data variable to 3rd API call data
    let(:data) do
      { idMeal: '52772',
        strMeal: 'Teriyaki Chicken Casserole',
        strDrinkAlternate: nil,
        strCategory: 'Chicken',
        strArea: 'Japanese',
        strInstructions: 'Preheat oven to 350° F...!',
        strMealThumb: 'https://www.themealdb.com/images/media/meals/wvpsxx1468256321.jpg',
        strTags: 'Meat,Casserole',
        strYoutube: 'https://www.youtube.com/watch?v=4aZr5hZXP_s',
        strIngredient1: 'soy sauce',
        strIngredient2: 'water',
        strIngredient3: 'brown sugar',
        strIngredient4: 'ground ginger',
        strIngredient5: 'minced garlic',
        strIngredient6: 'cornstarch',
        strIngredient7: 'chicken breasts',
        strIngredient8: 'stir-fry vegetables',
        strIngredient9: 'brown rice',
        strIngredient10: '',
        strIngredient11: '',
        strIngredient12: '',
        strIngredient13: '',
        strIngredient14: '',
        strIngredient15: '',
        strIngredient16: nil,
        strIngredient17: nil,
        strIngredient18: nil,
        strIngredient19: nil,
        strIngredient20: nil,
        strMeasure1: '3/4 cup',
        strMeasure2: '1/2 cup',
        strMeasure3: '1/4 cup',
        strMeasure4: '1/2 teaspoon',
        strMeasure5: '1/2 teaspoon',
        strMeasure6: '4 Tablespoons',
        strMeasure7: '2',
        strMeasure8: '1 (12 oz.)',
        strMeasure9: '3 cups',
        strMeasure10: '',
        strMeasure11: '',
        strMeasure12: '',
        strMeasure13: '',
        strMeasure14: '',
        strMeasure15: '',
        strMeasure16: nil,
        strMeasure17: nil,
        strMeasure18: nil,
        strMeasure19: nil,
        strMeasure20: nil,
        strSource: nil,
        strImageSource: nil,
        strCreativeCommonsConfirmed: nil,
        dateModified: nil }
    end

    it 'is an instance of the described class' do
      recipe = described_class.new(data)
      expect(recipe).to be_a(described_class)
    end

    it 'has the correct id' do
      recipe = described_class.new(data)
      expect(recipe.id).to eq('52772')
    end

    it 'does not have error attribute' do
      recipe = described_class.new(data)
      expect(recipe.error).to be_falsey
    end

    it 'has an array of ingredient hashes' do
      recipe = described_class.new(data)
      expect(recipe.ingredients).to be_an(Array)
      expect(recipe.ingredients).to all(be_a(Hash))
    end

    it 'has an array of direction strings' do
      recipe = described_class.new(data)
      expect(recipe.directions).to be_an(Array)
      expect(recipe.directions).to all(be_a(String))
    end
  end

  context 'when a PORO is created with nil data' do
    it 'is an instance of the described class' do
      recipe = described_class.new(nil)
      expect(recipe).to be_a(described_class)
    end

    it 'has a nil id' do
      recipe = described_class.new(nil)
      expect(recipe.id).to be_nil
    end

    it 'has error attribute' do
      recipe = described_class.new(nil)
      expect(recipe.error).to be_truthy
    end
  end
end
