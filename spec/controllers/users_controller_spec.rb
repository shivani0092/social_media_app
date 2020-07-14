require 'spec_helper'
RSpec.describe UsersController, type: :controller do
  include Devise::Test::ControllerHelpers
  describe 'Sessions' do
    it 'signs user in and out' do
      user = FactoryBot.create(:user)
      sign_in user
      get :index
      expect(response).to render_template(:index)
      sign_out user
      get :index
      expect(response).not_to render_template(:index)
    end
  end

  describe 'GET #index' do
    it 'returns success' do
      user = FactoryBot.create(:user)
      sign_in user
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #show' do
    it 'returns success' do
      user = FactoryBot.create(:user)
      sign_in user
      get :show, params: { id: user.id }
      expect(response).to render_template('show')
      expect(response).to have_http_status(:success)
    end
  end

end
