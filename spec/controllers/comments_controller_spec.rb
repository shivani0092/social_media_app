require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  include Devise::Test::ControllerHelpers

  describe 'POST #create' do
    it 'returns success' do
      user = FactoryBot.create(:user)
      sign_in user
      post_one = FactoryBot.create(:post)
      attributes = { user_routes: '/users/:user_id/posts/:post_id/comments', user_id: user.id, post_id: post_one.id,
                     comment: { user_id: 1,
                                post_id: 1,
                                description: 'comment text',
                                created_at: Time.now,
                                updated_at: Time.now } }
      expect { post :create, params: attributes, xhr: true }.to change(Comment, :count).by(1)
    end
  end
end
