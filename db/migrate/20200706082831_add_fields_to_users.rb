class AddFieldsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :name, :string
    add_index :users, :name, unique: true
    add_column :users, :small_bio, :text
  end
end
