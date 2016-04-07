class AddMyratingToBooks < ActiveRecord::Migration
  def change
    add_column :books, :my_rating, :integer
  end
end
