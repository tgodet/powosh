class AddAuthorAndAvailabiltiyToBooks < ActiveRecord::Migration
  def change
    add_column :books, :author, :string
    add_column :books, :available, :boolean, default: true
  end
end
