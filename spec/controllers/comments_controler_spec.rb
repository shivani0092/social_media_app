require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  include Devise::Test::ControllerHelpers

  # describe "POST #create" do
  #   it "returns success" do
  #     user = FactoryBot.create(:user)
  #     sign_in user
  #     post = FactoryBot.create(:post)
  #     attributes = { use_route: '/users/:user_id/posts/:post_id/comments',
  #                    user_id: user.id,
  #                    post_id: post.id,
  #                    comment: { description: 'Ruby on Rails', user_id: user.id, post_id: post.id 
  #                    } 
  #                   }
  #     expect { post :create, params: attributes }.to change(Comment, :count).by(1)
  #     expect(response).to have_http_status(:redirect)
  #   end
  # end

  # describe "GET #index" do
  #   it "returns success" do
  #     user = FactoryBot.create(:user)
  #     sign_in user
  #     post = FactoryBot.create(:post)
  #     FactoryBot.create(:comment, post_id: post.id)
  #     FactoryBot.create(:comment, post_id: post.id)
  #     get :index, params: { use_route: '/users/:user_id/posts/:post_id/comments', user_id: user.id, post_id: post.id }
  #     expect(response).to have_http_status(:redirect)
  #   end
  # end

end
