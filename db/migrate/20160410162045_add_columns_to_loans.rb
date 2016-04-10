class AddColumnsToLoans < ActiveRecord::Migration
  def change
    add_column :loans, :status, :string, default: "requested"
    add_column :loans, :last_action, :datetime
  end
end
