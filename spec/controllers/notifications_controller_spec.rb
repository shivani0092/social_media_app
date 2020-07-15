require 'rails_helper'

RSpec.describe Notifications::NotificationsController, type: :controller do
  include Devise::Test::ControllerHelpers

  describe 'GET #index' do
    it 'returns success' do
      user = FactoryBot.create(:user)
      sign_in user
      get :index, params: { use_route: '/notifications/notifications' }
      expect(response).to have_http_status(:success)
    end
  end

  describe 'DELETE #clean' do
    it 'returns success' do
      user1 = FactoryBot.create(:user, id: 2, email: 'shivani.guptatest@gmail.com', name: 'user2')
      sign_in user1
      user = FactoryBot.create(:user)
      post = FactoryBot.create(:post, user_id: user1.id)
      comment = FactoryBot.create(:comment, post_id: post.id, user_id: user.id)
      like = FactoryBot.create(:like, post_id: post.id, user_id: user.id)
      FactoryBot.create(:notification, actor: comment.user, user: comment.post.user, target: comment, second_target: post)
      FactoryBot.create(:notification, actor: like.user, user: like.post.user, target: like, second_target: post)
      delete :clean, params: { use_route: '/notifications/notifications' }
      expect(Notification.all).to eq([])
      expect(response).to have_http_status(:redirect)
    end
  end
end
