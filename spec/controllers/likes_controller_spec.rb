require 'rails_helper'

RSpec.describe LikesController, type: :controller do
  include Devise::Test::ControllerHelpers
  
  describe 'POST #create' do
    it 'returns success' do
      user = FactoryBot.create(:user)
      sign_in user
      user = FactoryBot.create(:user, id: 2, email: 'shivani.guptatest@gmail.com')
      post = FactoryBot.create(:post)
      attributes = { user_id: 2,
                     post_id: 1,
                     created_at: Time.now,
                     updated_at: Time.now }
      expect { post :create, params: { user_routes: '/posts/:post_id/likes', user_id: user.id, post_id: post.id, comment: attributes }, xhr: true }.to change(Like, :count).by(1)
    end
  end

  describe 'DELETE #destroy' do
    it 'returns success' do
      user = FactoryBot.create(:user)
      sign_in user
      post = FactoryBot.create(:post)
      like = FactoryBot.create(:like, user_id: user.id, post_id: post.id)
      expect { delete :destroy, params: { user_routes: '/posts/:post_id/likes/:id', post_id: post.id, id: like.id }, xhr: true }.to change(Like, :count).by(-1)
    end
  end
end
