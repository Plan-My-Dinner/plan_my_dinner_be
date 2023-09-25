require 'rails_helper'

RSpec.describe SavedRecipeFacade do
  context 'when returning a different Recipe PORO based on 3rd party data', :vcr do
    it 'returns a poro with recipe attributes' do
      saved_recipe = described_class.show_recipe('52772')

      expect(saved_recipe).to be_a(Recipe)
      expect(saved_recipe.id).to eq('52772')
    end

    it 'returns error poro if recipe doesnt exist' do
      saved_recipe = described_class.show_recipe('1')

      expect(saved_recipe).to be_a(Recipe)
      expect(saved_recipe.id).to be_nil
    end
  end
end
