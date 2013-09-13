class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :name
      t.string :author
      t.text :description
      t.string :book_cover
      t.integer :year
      t.string :isbn
      t.string :state

      t.timestamps
    end
  end
end
