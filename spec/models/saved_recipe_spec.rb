require 'rails_helper'

RSpec.describe SavedRecipe do
  describe 'relationships' do
    it { is_expected.to belong_to(:user) }
  end

  describe 'validations' do
    let(:user) { create(:user) }

    it { is_expected.to validate_inclusion_of(:favorited).in_array([true, false]) }
    it { is_expected.to validate_numericality_of(:api_recipe_id).only_integer }

    describe 'recipe is successfully saved' do
      it 'recipe is saved successfully' do
        saved_recipe = create(:saved_recipe, user:)

        expect(saved_recipe).to be_valid
        expect(saved_recipe.user_id).to eq(user.id)
      end
    end

    describe 'attributes are missing' do
      it 'still saves if favorited is not provided' do
        saved_recipe = described_class.create(user_id: user.id, api_recipe_id: 1)

        expect(saved_recipe).to be_valid
      end

      it 'defaults to false if favorited is not provided' do
        saved_recipe = described_class.create(user_id: user.id, api_recipe_id: 1)
        expect(saved_recipe.favorited).to be(false)
      end

      it 'does not save if User Id is not provided' do
        expect { create(:saved_recipe, user_id: nil) }.to raise_error('Validation failed: User must exist')
      end

      it 'does not save if User Id does not match an existing User' do
        expect { create(:saved_recipe, user_id: 3) }.to raise_error('Validation failed: User must exist')
      end
    end
  end
end
