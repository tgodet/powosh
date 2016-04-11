class AddGoogleCoverToBooks < ActiveRecord::Migration
  def change
    add_column :books, :google_cover, :string
  end
end
