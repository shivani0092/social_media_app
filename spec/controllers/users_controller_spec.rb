require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  include Devise::Test::ControllerHelpers

  describe "GET #index" do
    it "returns success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "returns success" do
      user = FactoryBot.create(:user)
      get :show, params: { id: user.id }
      
      response.should render_template :show
      expect(response).to have_http_status(:success)
    end
  end
end
