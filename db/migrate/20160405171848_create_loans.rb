class CreateLoans < ActiveRecord::Migration
  def change
    create_table :loans do |t|
      t.references :book, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.boolean :confirmed, default: false
      t.boolean :pending, default: false

      t.timestamps null: false
    end
  end
end
