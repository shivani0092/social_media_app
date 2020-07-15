require 'rails_helper'

RSpec.describe Like, type: :model do
  describe 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:post) }
  end

  describe 'Like' do
    describe '#like' do
      it 'create a first like notification' do
        user = FactoryBot.create(:user)
        user1 = FactoryBot.create(:user, id: 2, email: 'shivani.guptatest@gmail.com', name: 'user2')
        post = FactoryBot.create(:post, user_id: user1.id)
        like = FactoryBot.create(:like, user_id: user.id, post_id: post.id)
        expect(user1.notifications[0].user_id).to_not eq user.id
      end
    end
  end
end
