class AddFriendToUser < ActiveRecord::Migration
  def change
    add_column :users, :friends, :string
    add_column :users, :facebook_id, :integer
  end
end
