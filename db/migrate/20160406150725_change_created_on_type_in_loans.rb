class ChangeCreatedOnTypeInLoans < ActiveRecord::Migration
  def change
    change_column :loans, :created_at, :datetime
  end
end
