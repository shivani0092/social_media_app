class AddLikeToPost < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :like, :integer, array: true, default: '{}'
  end
end
