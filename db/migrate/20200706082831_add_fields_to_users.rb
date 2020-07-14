# This migration comes from notifications
class AddFieldsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name, :string
    add_index :users, :name, unique: true
    add_column :users, :small_bio, :text
  end
end
