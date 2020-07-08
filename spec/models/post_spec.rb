require 'rails_helper'

RSpec.describe Post, type: :model do

  describe 'associations' do
    it { should belong_to(:user) }
    it { should have_many(:comments).dependent(:destroy) }
  end

  it { should validate_presence_of :description }

end
