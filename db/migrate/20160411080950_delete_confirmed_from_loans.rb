class DeleteConfirmedFromLoans < ActiveRecord::Migration
  def change
    remove_column :loans, :confirmed
    remove_column :loans, :rejected
  end
end
