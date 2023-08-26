require 'rails_helper'
### ERROR: Validation failed: Email has already been taken
## Everytime test is run email can no longer be used until database is reset

RSpec.describe SavedRecipie, type: :model do
  describe 'relationships' do 
    it { should.belong_to(:user) }
    it { should.belong_to(:recipie) }
  end 

  describe 'validations' do
    it { is_expected.to validate_presence_of(:favorited) }
    it { is_expected.to validate_presence_of(:user_id) }
    it { is_expected.to validate_presence_of(:api_recipie_id) }

    describe 'recipie is sucsessfully saved' do 
      ## Create user and create recipie with users id
      user = User.create!(email: 'random@test4.com', password: 'password123', password_confirmation: 'password123')
      saved_recipie = SavedRecipie.create!(user_id: user.id, api_recipie_id: 1, favorited: true)

      ## Check for recipe being successfully scheduled
      expect(saved_recipie).to have_attribute(:user_id)
      expect(saved_recipie).to have_attribute(:api_recipie_id)
      expect(saved_recipie).to have_attribute(:favorited)
      expect(saved_recipie.user_id).to eq(user.id)
    end 

    describe 'attributes are missing' do
      let(:user) { User.create(email: 'random@test3.com', password: 'password123', password_confirmation: 'password123') }

      it 'user_id doesnt exist' do
        saved_recipie = SavedRecipie.create(api_recipie_id: 1, favorited: false)
        expect(saved_recipie).to be_nil
      end

      it 'recipie_id doesnt exist' do
        saved_recipie = SavedRecipie.create(user_id: user.id, favorited: false)
        expect(saved_recipie).to be_nil
      end

      it 'favorited doesnt exist' do
        saved_recipie = SavedRecipie.create(user_id: user.id, api_recipie_id: 1)
        expect(saved_recipie).to be_nil
      end
    end
  end
end
