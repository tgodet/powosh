class AddManualLendeeToLoans < ActiveRecord::Migration
  def change
    add_column :loans, :borrower_name_manual, :string
    add_column :loans, :manual, :boolean, default: false
  end
end
