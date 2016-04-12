class AddCreatedWithGoogleToBooks < ActiveRecord::Migration
  def change
    add_column :books, :created_with_google, :boolean
  end
end
