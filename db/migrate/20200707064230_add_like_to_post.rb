class AddLikeToPost < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :like, :integer, array: true, default: '{}'
  end
end
