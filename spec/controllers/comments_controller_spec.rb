require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  include Devise::Test::ControllerHelpers

  describe 'GET #index' do
    it 'returns success' do
      user = FactoryBot.create(:user)
      sign_in user
      post = FactoryBot.create(:post)
      get :index, params: { user_routes: '/users/:user_id/posts/:post_id/comments',
                            user_id: user.id,
                            post_id: post.id }, xhr: true
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST #create' do
    it 'returns success' do
      user = FactoryBot.create(:user)
      sign_in user
      post_one = FactoryBot.create(:post)
      attributes = { user_id: 1,
                     post_id: 1,
                     description: 'comment text',
                     created_at: Time.now,
                     updated_at: Time.now }

      expect { post :create, params: 
        { user_routes: '/users/:user_id/posts/:post_id/comments',
          user_id: user.id,
          post_id: post_one.id,
          comment: attributes }, xhr: true }.to change(Comment, :count).by(1)
    end
  end

end
