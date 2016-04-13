class AddManualStringtoLoans < ActiveRecord::Migration
  def change
    add_column :loans, :manual_string, :string
  end
end
