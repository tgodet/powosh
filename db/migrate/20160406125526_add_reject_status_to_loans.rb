class AddRejectStatusToLoans < ActiveRecord::Migration
  def change
    add_column :loans, :rejected, :boolean, default: false
  end
end
