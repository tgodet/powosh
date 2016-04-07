class AddMydescriptionToBooks < ActiveRecord::Migration
  def change
    add_column :books, :my_description, :string
  end
end
