class CreateEBooks < ActiveRecord::Migration
  def up
    create_table :e_books do |t|
      t.string :title
      t.string :file
      t.integer :book_id

      t.timestamps
    end
  end

  def down
    drop_table :e_books
  end
end
