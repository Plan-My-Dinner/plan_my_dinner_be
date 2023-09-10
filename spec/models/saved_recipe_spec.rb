require 'rails_helper'

RSpec.describe SavedRecipe do
  describe 'relationships' do
    it { is_expected.to belong_to(:user) }
  end

  describe 'validations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to validate_inclusion_of(:favorited).in_array([true, false]) }
    it { is_expected.to validate_numericality_of(:api_recipe_id).only_integer }

    describe 'recipe is successfully saved' do
      let(:user) { User.create!(email: 'random@test4.com', password: 'password123', password_confirmation: 'password123') }

      it 'recipe is saved successfully' do
        saved_recipe = described_class.create(user_id: user.id, favorited: true, api_recipe_id: 1)
        ## The recipe is saved successfully
        expect(saved_recipe).to be_valid
        ## The recipe is saved to the user
        expect(saved_recipe.user_id).to eq(user.id)
      end
    end

    describe 'attributes are missing' do
      let(:user) { User.create(email: 'random@test3.com', password: 'password123', password_confirmation: 'password123') }

      it "favorited doesn't exist" do
        saved_recipe = described_class.create(user_id: user.id, api_recipe_id: 1)
        ## The recipe is saved successfully
        expect(saved_recipe).to be_valid
        ## The recipe is defaulted to not favorited
        expect(saved_recipe.favorited).to be(false)
      end
    end
  end
end
