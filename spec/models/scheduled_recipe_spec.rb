require 'rails_helper'

RSpec.describe ScheduledRecipe do
  describe 'relationships' do
    it { is_expected.to belong_to(:saved_recipe) }
    it { is_expected.to have_one(:user).through(:saved_recipe) }
  end

  describe 'validations' do
    let(:scheduled_date) { DateTime.new(2006, 8, 5, 15, 5, 15) }
    let!(:saved_recipe) { create(:saved_recipe) }

    it { is_expected.to validate_presence_of(:scheduled_date) }

    describe 'Recipe is successfully scheduled' do
      it 'if valid Saved Recipe Id is provided and date provided' do
        scheduled_recipe = create(:scheduled_recipe, saved_recipe:, scheduled_date:)

        expect(scheduled_recipe).to be_valid
        expect(scheduled_recipe).to have_attributes(saved_recipe_id: saved_recipe.id, scheduled_date: DateTime.new(2006, 8, 5, 15, 5, 15))
      end
    end

    describe 'Recipe fails to be scheduled' do
      it 'if Saved Recipe Id is not provided' do
        expect { create(:scheduled_recipe, saved_recipe_id: nil) }.to raise_error('Validation failed: Saved recipe must exist')
      end

      it 'if Saved Recipe Id does not match an existing Saved Recipe' do
        expect { create(:scheduled_recipe, saved_recipe_id: 3) }.to raise_error('Validation failed: Saved recipe must exist')
      end
    end
  end
end
