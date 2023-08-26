require 'rails_helper'

RSpec.describe ScheduledRecipie do
  describe 'validations' do
    ## Create user, create recipie with users id, then set scheudle date
    let!(:user) { User.create(email: 'random@test.com', password: 'password123', password_confirmation: 'password123') }
    let!(:saved_recipie) { SavedRecipie.create!(user_id: user.id, api_recipie_id: 1, favorited: false) }
    let(:scheduled_date) { DateTime.new(2006, 8, 5, 15, 5, 15) }

    describe 'recipie is sucsessfully scheduled' do
      it 'schedules the recipe correctly' do
        scheduled_recipie = ScheduledRecipie.create(saved_recipie_id: saved_recipie.id, scheduled_date: scheduled_date)

        ## Check for recipe being successfully scheduled
        expect(scheduled_recipie).to have_attributes(saved_recipie_id: saved_recipie.id, scheduled_date: DateTime.new(2006, 8, 5, 15, 5, 15))
        expect(scheduled_recipie.saved_recipie_id).to eq(saved_recipie.id)
      end
    end 

    describe 'attributes are missing' do
      it 'saved_recipies_id doesnt exist' do
        scheduled_recipie = ScheduledRecipie.create(saved_recipie_id: saved_recipie.id, scheduled_date: scheduled_date)

        ## Check that ScheudleRecipie wasn't created
        expect(scheduled_recipie).to be_nil
      end

      it 'scheduled_date doesnt exist' do
        scheduled_recipie = ScheduledRecipie.create(saved_recipie_id: saved_recipie.id, scheduled_date: scheduled_date)

        ## Check that ScheudleRecipie wasn't created
        expect(scheduled_recipie).to be_nil
      end
    end
  end

  describe 'relationships' do 
    it { should have_many(:saved_recipies) }
  end 
end
