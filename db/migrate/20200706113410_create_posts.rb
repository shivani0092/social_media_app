class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.references :user, null: false, foreign_key: true
      t.text :description
      t.string :avatar

      t.timestamps
    end
  end
end