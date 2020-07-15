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
end
