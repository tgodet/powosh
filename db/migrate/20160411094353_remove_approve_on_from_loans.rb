class RemoveApproveOnFromLoans < ActiveRecord::Migration
  def change
    remove_column :loans, :approved_on
  end
end
