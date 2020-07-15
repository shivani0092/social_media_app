# UsersController
class UsersController < ApplicationController
  before_action :authenticate_user!, only: %w[show index]
  include Indexable

  def show
    @user = User.find_by_id(params[:id])
  end
end
