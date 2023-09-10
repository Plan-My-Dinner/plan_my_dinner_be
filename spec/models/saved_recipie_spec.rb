require 'rails_helper'

RSpec.describe SavedRecipie do
  describe 'validations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to validate_inclusion_of(:favorited).in_array([true, false]) }
    it { is_expected.to validate_numericality_of(:api_recipie_id).only_integer }

    describe 'recipie is sucsessfully saved' do
      let(:user) { User.create!(email: 'random@test4.com', password: 'password123', password_confirmation: 'password123') }

      it 'recipie is saved sucsessfully' do
        saved_recipie = described_class.create(user_id: user.id, favorited: true, api_recipie_id: 1)
        ## The recipie is saved succsessfuly
        expect(saved_recipie).to be_valid
        ## The recipie is saved to the user
        expect(saved_recipie.user_id).to eq(user.id)
      end
    end

    describe 'attributes are missing' do
      let(:user) { User.create(email: 'random@test3.com', password: 'password123', password_confirmation: 'password123') }

      it 'favorited doesnt exist' do
        saved_recipie = described_class.create(user_id: user.id, api_recipie_id: 1)
        ## The recipie is saved succsessfuly
        expect(saved_recipie).to be_valid
        ## The recipie is defaulted to not favorited
        expect(saved_recipie.favorited).to be(false)
      end
    end
  end

  describe 'relationships' do
    it { is_expected.to belong_to(:user) }
  end
end
