class AddOmniauthToUsers < ActiveRecord::Migration
  def change
    add_column :users, :provider, :string
    add_column :users, :uid, :string
    add_column :users, :picture, :string
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :token, :string
    add_column :users, :token_expiry, :datetime
  end
end
