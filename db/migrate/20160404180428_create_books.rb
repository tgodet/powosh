class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.string :description
      t.string :language
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
