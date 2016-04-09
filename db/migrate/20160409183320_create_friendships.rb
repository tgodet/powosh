class CreateFriendships < ActiveRecord::Migration
  def change
    create_table :friendships do |t|
      t.references :user, index: true, foreign_key: true
      t.integer :friend_id, index:true

      t.timestamps null: false
    end

    add_foreign_key :friendships, :users, column: :friend_id
  end
end
