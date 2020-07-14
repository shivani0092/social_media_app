require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  include Devise::Test::ControllerHelpers
  describe 'GET #new' do
    it 'returns success' do
      user = FactoryBot.create(:user)
      sign_in user
      get :new, params: { use_route: '/users/:user_id/posts/new', user_id: user.id }
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST #create' do
    it 'returns success' do
      user = FactoryBot.create(:user)
      sign_in user
      attributes = { use_route: '/users/:user_id/posts',
                     user_id: user.id,
                     post: { description: 'Ruby on Rails', avatar: '/assets/images/image.jpg',
                     user_id: 1 } }
      expect { post :create, params: attributes }.to change(Post, :count).by(1)
      expect(response).to have_http_status(:redirect)
      expect(response).to redirect_to(users_url(assigns(:posts)))
    end
  end

  describe 'GET #index' do
    it 'returns success' do
      user = FactoryBot.create(:user)
      sign_in user
      get :index, params: { use_route: '/users/:user_id/posts', user_id: user.id }
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #edit' do
    it 'returns success' do
      user = FactoryBot.create(:user)
      post = FactoryBot.create(:post)
      sign_in user
      get :edit, params: { use_route: '/users/:user_id/posts/:id/edit', user_id: user.id, id: post.id }
      expect(response).to have_http_status(:success)
    end
  end

  describe 'PATCH #update' do
    it 'returns success' do
      user = FactoryBot.create(:user)
      post = FactoryBot.create(:post)
      sign_in user
      attributes = { use_route: '/users/:user_id/posts/:id',
                     user_id: user.id,
                     id: post.id,
                     post: { description: 'new text' } }
      patch :update, params: attributes

      post.reload
      expect(response).to have_http_status(:redirect)
      expect(response).to redirect_to(users_url(assigns(:posts)))
      expect(post.description).to eq('new text')
    end
  end

  describe 'DELETE #destroy' do
    it 'returns success' do
      user = FactoryBot.create(:user)
      post = FactoryBot.create(:post)
      sign_in user
      attributes = { use_route: '/users/:user_id/posts/:id', user_id: user.id, id: post.id }
      expect { delete :destroy, params: attributes, xhr: true }.to change(Post, :count).by(-1)
    end
  end
end
