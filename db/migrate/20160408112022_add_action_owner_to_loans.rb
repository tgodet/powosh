class AddActionOwnerToLoans < ActiveRecord::Migration
  def change
    add_column :loans, :action_owner, :integer
  end
end
