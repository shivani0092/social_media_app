require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :email }
    it { should validate_presence_of :password }
    it { should validate_presence_of :password_confirmation }
    context 'with an invalid email address' do
      let(:email) { 'invalid.email.com' }
      it { should_not be_valid }
    end
  end

  describe 'email uniqueness' do
    before { create :user, email: 'foo@bar.com' }
    let(:user) { build :user, email: 'foo@bar.com' }
    it do
      user.valid?
      expect(user.errors[:email]).to be == ['has already been taken']
    end
  end
  
  describe 'associations' do
    it { should have_many(:comments).through(:posts) }
    it { should have_many(:posts).dependent(:destroy) }
  end

end
