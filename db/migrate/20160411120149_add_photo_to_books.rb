class AddPhotoToBooks < ActiveRecord::Migration
  def change
    add_column :books, :photo, :string
  end
end
