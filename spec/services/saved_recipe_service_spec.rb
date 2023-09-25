require 'rails_helper'

RSpec.describe SavedRecipeService do
  context 'when making a call to the 3rd party API' do
    it 'returns recipe data in correct format', :vcr do
      recipe = described_class.get_show_recipe('52772')

      expect(recipe).to be_a(Hash)
      expect(recipe[:meals]).to be_a(Array)
    end

    it 'returns recipe data based on id', :vcr do
      recipe = described_class.get_show_recipe('52772')

      expect(recipe[:meals][0]).to have_key(:idMeal)
      expect(recipe[:meals][0][:idMeal]).to eq('52772')
    end

    it 'id doesnt match any recipies', :vcr do
      recipe = described_class.get_show_recipe('1')

      expect(recipe).to be_a(Hash)
      expect(recipe[:meals]).to be_nil
    end
  end
end
