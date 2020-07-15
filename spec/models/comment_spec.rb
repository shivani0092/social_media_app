require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:post) }
  end

  describe 'Comment' do
    describe '#commit' do
      it 'creates a first project for the user' do
        user = FactoryBot.create(:user)
        user1 = FactoryBot.create(:user, id: 2, email: 'shivani.guptatest@gmail.com', name: 'user2')
        post = FactoryBot.create(:post, user_id: user.id)
        FactoryBot.create(:comment, user_id: user1.id, post_id: post.id)
        expect(user.notifications[0].user_id).to eq user.id
      end
    end
  end
end
