class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :first_name
      t.string :last_name
      t.string :address
      t.string :profile_picture
      t.date :birth_date
      t.boolean :book_owner
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
