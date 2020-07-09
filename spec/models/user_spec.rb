require 'rails_helper'

RSpec.describe User, type: :model do
  subject {
    described_class.new(name: "Anything",
                       email: "test@anything.com",
                       password: "123456",
                       password_confirmation: "123456")
  }

  it { should validate_uniqueness_of(:email).case_insensitive }

  describe 'associations' do
    it { should have_many(:comments).through(:posts) }
    it { should have_many(:posts).dependent(:destroy) }
  end

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a name" do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a email" do
    subject.email = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a password" do
    subject.password = nil
    expect(subject).to_not be_valid
  end

  it "is not valid if password characters less than 6" do
    subject.password = "1234"
    expect(subject).to_not be_valid
  end

  it "is not valid without a password confirmation" do
    subject.password_confirmation = nil
    expect(subject).to_not be_valid
  end

end
