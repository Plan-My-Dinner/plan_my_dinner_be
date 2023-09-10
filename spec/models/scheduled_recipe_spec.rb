require 'rails_helper'

RSpec.describe ScheduledRecipe do

  describe 'relationships' do
    it { should have_many(:saved_recipes) }
  end

  describe 'validations' do
    ## Create user, create recipe with users id, then set schedule date
    let!(:user) { User.create(email: 'random@test.com', password: 'password123', password_confirmation: 'password123') }
    let!(:saved_recipe) { SavedRecipe.create!(user_id: user.id, api_recipe_id: 1, favorited: false) }
    let(:scheduled_date) { DateTime.new(2006, 8, 5, 15, 5, 15) }

    describe 'recipe is successfully scheduled' do
      it 'schedules the recipe correctly' do
        scheduled_recipe = ScheduledRecipe.create(saved_recipe_id: saved_recipe.id, scheduled_date: scheduled_date)

        ## Check for recipe being successfully scheduled
        expect(scheduled_recipe).to have_attributes(saved_recipe_id: saved_recipe.id, scheduled_date: DateTime.new(2006, 8, 5, 15, 5, 15))
        expect(scheduled_recipe.saved_recipe_id).to eq(saved_recipe.id)
      end
    end

    describe 'attributes are missing' do
      it "saved_recipes_id doesn't exist" do
        scheduled_recipe = ScheduledRecipe.create(saved_recipe_id: saved_recipe.id, scheduled_date: scheduled_date)

        ## Check that ScheudleRecipe wasn't created
        expect(scheduled_recipe).to be_nil
      end

      it 'scheduled_date doesnt exist' do
        scheduled_recipe = ScheduledRecipe.create(saved_recipe_id: saved_recipe.id, scheduled_date: scheduled_date)

        ## Check that ScheduledRecipe wasn't created
        expect(scheduled_recipe).to be_nil
      end
    end
  end
end
