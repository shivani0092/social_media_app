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
      user = FactoryBot.create(:user)
      sign_in user
      post = FactoryBot.create(:post)
      comment = FactoryBot.create(:comment, post_id: post.id)
      FactoryBot.create(:notification, actor: comment.user, user: comment.post.user, target: comment, second_target: post )
      FactoryBot.create(:notification, actor: comment.user, user: comment.post.user, target: comment, second_target: post, target_type: 'Like')
      delete :clean, params: { use_route: '/notifications/notifications' }
      expect(Notification.all).to eq([])
      expect(response).to have_http_status(:redirect)
    end
  end

end
