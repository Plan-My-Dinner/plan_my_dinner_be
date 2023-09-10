require 'rails_helper'
# rubocop:disable RSpec/NestedGroups

RSpec.describe User do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_uniqueness_of(:email).case_insensitive }
    it { is_expected.to have_secure_password }

    describe 'secure password' do
      it 'stores secured passwords as password_digest not as password' do
        user = described_class.create(email: 'random@test.com', password: 'password123', password_confirmation: 'password123')
        expect(user).not_to have_attribute(:password)
        expect(user.password_digest).not_to eq('password123')
      end
    end

    describe 'email format' do
      describe 'has the @ symbol' do
        it { is_expected.to allow_value('a@mail.com').for(:email) }

        it { is_expected.not_to allow_value('test.email.com').for(:email) }
      end

      describe 'has a 1 or more non-space character local address' do
        it { is_expected.to allow_value('a@mail.com').for(:email) }
        it { is_expected.to allow_value('a_Random_3mail_T!st@mail.com').for(:email) }

        it { is_expected.not_to allow_value('@gmail.com').for(:email) }
        it { is_expected.not_to allow_value(' a@gmail.com').for(:email) }
      end

      describe 'has a 1 or more alphanumeric character host' do
        it { is_expected.to allow_value('test@a.com').for(:email) }
        it { is_expected.to allow_value('test@abusin3ss.com').for(:email) }

        it { is_expected.not_to allow_value('test@com').for(:email) }
        it { is_expected.not_to allow_value('test@').for(:email) }
      end

      describe 'has a period between the host and domain' do
        it { is_expected.to allow_value('test@mail.com').for(:email) }

        it { is_expected.not_to allow_value('test@mailcom').for(:email) }
        it { is_expected.not_to allow_value('test@mail,com').for(:email) }
      end

      describe 'has a 2 or more alpha character domain' do
        it { is_expected.to allow_value('test@mail.co').for(:email) }
        it { is_expected.to allow_value('test@business.mail.something').for(:email) }

        it { is_expected.not_to allow_value('test@mail.i').for(:email) }
        it { is_expected.not_to allow_value('test@mail.500').for(:email) }
      end
    end
  end

  describe 'relationships' do
    it { is_expected.to have_many(:saved_recipies) }
  end
end
# rubocop:enable RSpec/NestedGroups
