class RemoveLikeFormPost < ActiveRecord::Migration[5.2]
  def change
  	remove_column :posts, :like, :integer, array: true, default: '{}'
  end
end
