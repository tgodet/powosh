class DeleteUnnecessaryColumnsFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :first_name, :string
    remove_column :users, :last_name, :string
    remove_column :users, :picture, :string
    remove_column :users, :friends, :string
    remove_column :users, :facebook_id, :integer
  end
end
