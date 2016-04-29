class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :postbody
      t.integer :user_id
      t.datetime :created_at

      t.timestamps null: false
    end
  end
end
