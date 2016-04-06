class AddDateApprovedToLoans < ActiveRecord::Migration
  def change
    add_column :loans, :approved_on, :date
  end
end
